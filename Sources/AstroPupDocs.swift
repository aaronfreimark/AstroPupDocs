/// Tiny access layer over the bundled documentation tree.
///
/// The package's entire job is to carry `docs/` (one markdown page
/// per app, plus images) into each consuming app's bundle; this file
/// is the minimal Swift surface for finding those files.  Parsing
/// (front matter, image blocks) deliberately lives in the consuming
/// apps for now — if it ever needs to be shared between apps, it can
/// graduate into this package without changing the content contract.
import Foundation

public enum AstroPupDocs {

    /// The resource bundle containing the `docs/` tree.
    public static var bundle: Bundle { .module }

    /// Root of the bundled `docs/` tree.  The package declares
    /// `.copy("docs")`, so the directory structure is preserved
    /// verbatim inside the resource bundle.
    public static var docsRoot: URL? {
        bundle.resourceURL?.appendingPathComponent("docs", isDirectory: true)
    }

    /// URL of an app's guide page — e.g. `pageURL(app: "sky")` →
    /// `docs/<locale>/sky.md` — for `locale`, falling back to
    /// English when the locale folder or the page is missing.
    /// Returns nil only when the page doesn't exist in English
    /// either (the app slug has no guide yet).
    ///
    /// Plain path construction (not `url(forResource:subdirectory:)`)
    /// because resource lookup treats directories inconsistently
    /// across platforms; the copied tree's layout is fully known, so
    /// a direct path + existence check is the reliable route.
    public static func pageURL(
        app: String,
        locale: String = Locale.current.language.languageCode?.identifier ?? "en"
    ) -> URL? {
        guard let root = docsRoot else { return nil }
        let fm = FileManager.default
        let localized = root
            .appendingPathComponent(locale, isDirectory: true)
            .appendingPathComponent(app + ".md")
        if fm.fileExists(atPath: localized.path) { return localized }
        let english = root
            .appendingPathComponent("en", isDirectory: true)
            .appendingPathComponent(app + ".md")
        return fm.fileExists(atPath: english.path) ? english : nil
    }

    /// Resolve an image path as written in page markdown — e.g.
    /// `images/shading-legend-hours.png` — to its bundled URL.
    /// Image paths in the content are always relative to the
    /// `docs/` root (see README.md's authoring contract).  Returns
    /// nil when the referenced file isn't in the bundle, so a typo
    /// in a page degrades to a skipped image rather than a crash.
    public static func imageURL(forDocsRelativePath path: String) -> URL? {
        guard let root = docsRoot else { return nil }
        let url = root.appendingPathComponent(path)
        return FileManager.default.fileExists(atPath: url.path) ? url : nil
    }
}
