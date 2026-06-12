/// Unit tests for the canonical content-contract parser.  Pure,
/// synthetic-input tests that pin the format itself; each consuming
/// app additionally runs bundled-content contract tests against the
/// page it ships (slug-specific, with platform checks like SF Symbol
/// validity that belong app-side).
import Testing
import Foundation
@testable import AstroPupDocs

@Suite("DocumentationContent — parser")
struct DocumentationContentParserTests {

    @Test func parsesFrontMatterAndBody() {
        let raw = """
        ---
        id: sky
        title: A Test Page
        ---

        # Heading

        Body text.
        """
        let page = DocumentationContent.parsePage(raw)
        #expect(page?.id == "sky")
        #expect(page?.title == "A Test Page")
        #expect(page?.bodyMarkdown.hasPrefix("# Heading") == true)
    }

    @Test func missingFrontMatterIsRejected() {
        #expect(DocumentationContent.parsePage("# Just a heading\n\nNo front matter.") == nil)
    }

    @Test func missingRequiredKeysAreRejected() {
        let noTitle = "---\nid: x\n---\nbody"
        #expect(DocumentationContent.parsePage(noTitle) == nil)
    }

    @Test func blockDecomposition() {
        let body = """
        # Title

        First paragraph
        continues here.

        - bullet one
        - bullet two
          continues

        ![A legend](images/legend.png)

        Final words.
        """
        let blocks = DocumentationContent.blocks(from: body)
        #expect(blocks == [
            .heading(level: 1, text: "Title"),
            .paragraph("First paragraph continues here."),
            .bullets(["bullet one", "bullet two continues"]),
            .image(path: "images/legend.png", alt: "A legend", caption: nil),
            .paragraph("Final words."),
        ])
    }

    @Test func inlineImageStaysInProse() {
        // Contract: images must be block-level.  An inline image is
        // NOT lifted into an image block — it stays literal text,
        // ugly enough that an author notices in review.
        let blocks = DocumentationContent.blocks(from: "Some text ![x](images/y.png) more.")
        #expect(blocks.count == 1)
        if case .paragraph = blocks[0] {} else {
            Issue.record("inline image should remain part of the paragraph")
        }
    }

    @Test func imageCaptionParsesFromTitleSyntax() {
        let blocks = DocumentationContent.blocks(
            from: """
            ![Saturn](images/planet-saturn.png "Rings at their real tilt")
            """)
        #expect(blocks == [
            .image(path: "images/planet-saturn.png",
                   alt: "Saturn",
                   caption: "Rings at their real tilt"),
        ])
    }

    @Test func inlineSegmentsSplitSFSymbolTokens() {
        typealias Seg = DocumentationContent.InlineSegment
        #expect(DocumentationContent.inlineSegments("plain text")
                == [Seg.text("plain text")])
        #expect(DocumentationContent.inlineSegments("Tap **Filters** :sf:line.3.horizontal.decrease: to begin")
                == [Seg.text("Tap **Filters** "),
                    Seg.symbol("line.3.horizontal.decrease"),
                    Seg.text(" to begin")])
        #expect(DocumentationContent.inlineSegments(":sf:clock:")
                == [Seg.symbol("clock")])
    }

    /// The packaged English pages themselves parse — a floor under
    /// every app's own contract tests.
    @Test func packagedEnglishPagesParse() throws {
        let dir = try #require(AstroPupDocs.docsRoot?.appendingPathComponent("en", isDirectory: true))
        let files = try FileManager.default.contentsOfDirectory(at: dir, includingPropertiesForKeys: nil)
            .filter { $0.pathExtension == "md" }
        #expect(!files.isEmpty)
        for url in files {
            let raw = try String(contentsOf: url, encoding: .utf8)
            #expect(DocumentationContent.parsePage(raw) != nil, "\(url.lastPathComponent) failed to parse")
        }
    }
}
