/// The shared documentation renderer — one scrolling page of
/// `DocumentationBlock`s, used identically by every AstroPup app.
///
/// Deliberately chrome-free: the consuming app wraps this in its
/// own NavigationStack, title, and dismiss affordance so each app's
/// sheet conventions stay its own.  The view loads the page for the
/// given app slug on appear and shows a quiet unavailable state if
/// the bundle is malformed (content ships with the binary, so users
/// should never see it).
///
/// Rendering walks the blocks: headings and bullets get explicit
/// SwiftUI treatments, prose goes through `AttributedString(markdown:)`
/// for inline styling, `:sf:…:` tokens become native
/// `Image(systemName:)` runs, and image blocks load from the docs
/// bundle with the alt text as the accessibility label and the
/// optional title as a visible caption.
// Cross-platform: iOS hosts this in a sheet (Sky, View), macOS in an
// auxiliary window (Blink) — only the bitmap type differs (UIImage /
// NSImage); everything else is shared SwiftUI.
import SwiftUI
#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

public struct DocumentationPageView: View {

    private let app: String

    /// Loaded once on appear — one small bundled file, so the
    /// synchronous load is imperceptible.
    @State private var page: DocumentationPage?

    public init(app: String) {
        self.app = app
    }

    public var body: some View {
        Group {
            if let page {
                ScrollView {
                    VStack(alignment: .leading, spacing: 14) {
                        ForEach(
                            Array(DocumentationContent.blocks(from: page.bodyMarkdown).enumerated()),
                            id: \.offset
                        ) { _, block in
                            DocumentationBlockView(block: block)
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            } else {
                ContentUnavailableView(
                    "Documentation Unavailable",
                    systemImage: "book",
                    description: Text("The documentation is missing from this build.")
                )
            }
        }
        .onAppear {
            if page == nil {
                page = DocumentationContent.loadPage(app: app)
            }
        }
    }
}

/// One rendered block of the documentation page.
private struct DocumentationBlockView: View {

    let block: DocumentationBlock

    var body: some View {
        switch block {
        case .heading(let level, let text):
            Text(text)
                .font(headingFont(level))
                .padding(.top, headingTopPadding(level))

        case .paragraph(let markdown):
            inlineText(markdown)

        case .bullets(let items):
            VStack(alignment: .leading, spacing: 6) {
                ForEach(Array(items.enumerated()), id: \.offset) { _, item in
                    HStack(alignment: .firstTextBaseline, spacing: 8) {
                        Text("•").foregroundStyle(.secondary)
                        inlineText(item)
                    }
                }
            }

        case .image(let path, let alt, let caption):
            if let image = Self.bitmap(forDocsRelativePath: path) {
                VStack(alignment: .center, spacing: 6) {
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .accessibilityLabel(alt)
                    if let caption {
                        Text(caption)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                    }
                }
                .frame(maxWidth: .infinity)
            }
            // A missing image (typo'd path) renders nothing rather
            // than a broken placeholder — each app's bundled-content
            // contract tests assert every referenced image resolves,
            // so this only protects shipped builds against future
            // content slips.
        }
    }

    /// One block's inline content as a single `Text` — markdown
    /// styling for the prose runs, native `Image(systemName:)` for
    /// `:sf:…:` tokens, concatenated so symbols flow with the text
    /// at the surrounding font size.
    private func inlineText(_ markdown: String) -> Text {
        DocumentationContent.inlineSegments(markdown)
            .reduce(Text(verbatim: "")) { acc, segment in
                switch segment {
                case .text(let t):   acc + Text(inline(t))
                case .symbol(let n): acc + Text(Image(systemName: n))
                }
            }
    }

    /// Inline markdown (bold / italic / links / code) within one
    /// run.  Falls back to the literal text if parsing fails so
    /// content can never blank out a section.
    private func inline(_ markdown: String) -> AttributedString {
        (try? AttributedString(
            markdown: markdown,
            options: .init(interpretedSyntax: .inlineOnlyPreservingWhitespace)
        )) ?? AttributedString(markdown)
    }

    private func headingFont(_ level: Int) -> Font {
        switch level {
        case 1:  .title2.bold()
        case 2:  .title3.bold()
        default: .headline
        }
    }

    /// Extra space above a heading (added to the page's block
    /// spacing).  `##` section titles get a markedly larger gap so
    /// the page's major sections read at a glance while scrolling.
    private func headingTopPadding(_ level: Int) -> CGFloat {
        switch level {
        case 1:  0
        case 2:  24
        default: 8
        }
    }

    /// A docs-bundle bitmap as a SwiftUI `Image` — the one spot the
    /// platforms diverge (UIImage vs NSImage file loading).
    private static func bitmap(forDocsRelativePath path: String) -> Image? {
        guard let url = AstroPupDocs.imageURL(forDocsRelativePath: path) else { return nil }
        #if canImport(UIKit)
        guard let image = UIImage(contentsOfFile: url.path) else { return nil }
        return Image(uiImage: image)
        #elseif canImport(AppKit)
        guard let image = NSImage(contentsOfFile: url.path) else { return nil }
        return Image(nsImage: image)
        #else
        return nil
        #endif
    }
}
