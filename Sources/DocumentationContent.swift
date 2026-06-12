/// The canonical parser for the AstroPupDocs content contract —
/// shared by every consuming app so the format has exactly one
/// implementation (see README.md for the authoring rules it
/// enforces).
///
/// Two layers, both pure and synchronous so they're directly
/// unit-testable (this package's own test target covers them;
/// each app additionally runs bundled-content contract tests
/// against the page it ships):
///
///   1. **Front matter** — a page opens with a `---` fenced block
///      of simple `key: value` lines (`id`, `title`).
///   2. **Blocks** — the body decomposes into heading / paragraph /
///      bullet-list / image blocks, plus `:sf:symbol:` inline
///      segments.  `AttributedString(markdown:)` handles inline
///      styling within a run, but SwiftUI `Text` won't *render*
///      markdown block structure, images, or SF Symbols — the
///      block/segment layers exist so the view can.
import Foundation

/// One app's documentation page, parsed from its markdown file.
public struct DocumentationPage: Equatable, Sendable {
    /// Stable identifier from front matter — the app slug.
    public let id: String
    public let title: String
    /// Body markdown with the front matter stripped.
    public let bodyMarkdown: String

    public init(id: String, title: String, bodyMarkdown: String) {
        self.id = id
        self.title = title
        self.bodyMarkdown = bodyMarkdown
    }
}

/// One renderable block of a page body.
public enum DocumentationBlock: Equatable, Sendable {
    /// `#` / `##` / `###` heading; level 1…3.
    case heading(level: Int, text: String)
    /// Prose paragraph — consecutive non-blank lines joined with
    /// spaces.  May contain inline markdown (bold, links, code).
    case paragraph(String)
    /// A `- ` bullet list; one element per bullet, continuation
    /// lines merged.  Elements may contain inline markdown.
    case bullets([String])
    /// Block-level image: `![alt](images/…)` alone on its line,
    /// optionally with a visible caption via the standard markdown
    /// title syntax — `![alt](path "Caption")`.  `path` is
    /// docs-root-relative per the contract.
    case image(path: String, alt: String, caption: String?)
}

public enum DocumentationContent {

    /// An app's documentation page from the bundled docs (current
    /// locale, English fallback).  Synchronous: one small local
    /// file.  Nil only when the docs bundle is missing, the app has
    /// no page, or the page is malformed.
    public static func loadPage(app: String, locale: String? = nil) -> DocumentationPage? {
        let url: URL?
        if let locale {
            url = AstroPupDocs.pageURL(app: app, locale: locale)
        } else {
            url = AstroPupDocs.pageURL(app: app)
        }
        guard let url,
              let raw = try? String(contentsOf: url, encoding: .utf8)
        else { return nil }
        return parsePage(raw)
    }

    // MARK: - Front matter

    /// Parse a page file: front matter + body.  Returns nil when
    /// the front matter fence or the required `id` / `title` keys
    /// are missing — a malformed page renders the unavailable
    /// state rather than half-broken content.
    public static func parsePage(_ raw: String) -> DocumentationPage? {
        let lines = raw.components(separatedBy: "\n")
        guard lines.first?.trimmingCharacters(in: .whitespaces) == "---" else { return nil }
        guard let closeIdx = lines.dropFirst().firstIndex(where: {
            $0.trimmingCharacters(in: .whitespaces) == "---"
        }) else { return nil }

        var meta: [String: String] = [:]
        for line in lines[1..<closeIdx] {
            guard let colon = line.firstIndex(of: ":") else { continue }
            let key = line[..<colon].trimmingCharacters(in: .whitespaces)
            let value = line[line.index(after: colon)...].trimmingCharacters(in: .whitespaces)
            guard !key.isEmpty, !value.isEmpty else { continue }
            meta[key] = value
        }

        guard let id = meta["id"], let title = meta["title"] else { return nil }

        let body = lines[(closeIdx + 1)...]
            .joined(separator: "\n")
            .trimmingCharacters(in: .whitespacesAndNewlines)

        return DocumentationPage(id: id, title: title, bodyMarkdown: body)
    }

    // MARK: - Inline SF Symbol tokens

    /// One run of inline content within a paragraph or bullet —
    /// either ordinary markdown text or an SF Symbol reference.
    /// Views concatenate these into a single `Text`, rendering
    /// symbols natively via `Image(systemName:)`; the website
    /// substitutes pre-rendered PNGs from `docs/images/sf/`.
    public enum InlineSegment: Equatable, Sendable {
        case text(String)
        case symbol(String)
    }

    /// `:sf:symbol.name:` — the docs contract's only extension
    /// beyond CommonMark (see README.md).
    private static let sfToken = #/:sf:(?<name>[a-z0-9.]+):/#

    /// Split a block's text into text / symbol segments.  Text with
    /// no tokens comes back as a single `.text` segment, so the
    /// common case stays a one-element pass-through.
    public static func inlineSegments(_ s: String) -> [InlineSegment] {
        var out: [InlineSegment] = []
        var rest = Substring(s)
        while let m = rest.firstMatch(of: sfToken) {
            if m.range.lowerBound > rest.startIndex {
                out.append(.text(String(rest[rest.startIndex..<m.range.lowerBound])))
            }
            out.append(.symbol(String(m.name)))
            rest = rest[m.range.upperBound...]
        }
        if !rest.isEmpty { out.append(.text(String(rest))) }
        return out
    }

    // MARK: - Block decomposition

    /// Matches a line that is ENTIRELY one image reference —
    /// `![alt](path)` or `![alt](path "Caption")` with nothing
    /// else.  The optional quoted segment is markdown's standard
    /// image *title*, which the contract repurposes as a visible
    /// caption.  Inline images are disallowed by the contract, so
    /// anything not matching this renders as ordinary paragraph
    /// text (where the syntax shows up literally — ugly enough
    /// that authors notice).
    private static let imageLine = #/^!\[(?<alt>[^\]]*)\]\((?<path>[^)\s]+)(?:\s+"(?<caption>[^"]*)")?\)$/#

    /// Decompose a page body into renderable blocks.
    public static func blocks(from markdown: String) -> [DocumentationBlock] {
        var blocks: [DocumentationBlock] = []
        var paragraph: [String] = []
        var bullets: [String] = []

        func flushParagraph() {
            if !paragraph.isEmpty {
                blocks.append(.paragraph(paragraph.joined(separator: " ")))
                paragraph = []
            }
        }
        func flushBullets() {
            if !bullets.isEmpty {
                blocks.append(.bullets(bullets))
                bullets = []
            }
        }

        for rawLine in markdown.components(separatedBy: "\n") {
            let line = rawLine.trimmingCharacters(in: .whitespaces)

            if line.isEmpty {
                flushParagraph(); flushBullets()
                continue
            }
            if let match = line.wholeMatch(of: imageLine) {
                flushParagraph(); flushBullets()
                blocks.append(.image(
                    path: String(match.path),
                    alt: String(match.alt),
                    caption: match.caption.map(String.init)
                ))
                continue
            }
            if line.hasPrefix("#") {
                flushParagraph(); flushBullets()
                let level = line.prefix(while: { $0 == "#" }).count
                let text = line.drop(while: { $0 == "#" })
                    .trimmingCharacters(in: .whitespaces)
                blocks.append(.heading(level: min(level, 3), text: text))
                continue
            }
            if line.hasPrefix("- ") {
                flushParagraph()
                bullets.append(String(line.dropFirst(2)))
                continue
            }
            // Continuation line: extends the open bullet if a list
            // is in progress, otherwise the open paragraph.
            if !bullets.isEmpty {
                bullets[bullets.count - 1] += " " + line
            } else {
                paragraph.append(line)
            }
        }
        flushParagraph(); flushBullets()
        return blocks
    }
}
