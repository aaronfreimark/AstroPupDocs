/// Tiny access layer over the bundled documentation tree.
///
/// The package's entire job is to carry `docs/` (markdown + images)
/// into each consuming app's bundle; this file is the minimal Swift
/// surface for finding those files.  Parsing (front matter, image
/// blocks) deliberately lives in the consuming apps for now — if it
/// ever needs to be shared between Sky and Horizon, it can graduate
/// into this package without changing the content contract.
import Foundation

public enum AstroPupDocs {

    /// The resource bundle containing the `docs/` tree.
    public static var bundle: Bundle { .module }

    /// Directory containing the topic markdown files for `locale`,
    /// falling back to English when the locale folder doesn't exist.
    /// Returns nil only if the bundle is malformed (no `docs/en`).
    public static func topicsDirectory(locale: String = Locale.current.language.languageCode?.identifier ?? "en") -> URL? {
        if let url = bundle.url(forResource: locale, withExtension: nil, subdirectory: "docs"),
           FileManager.default.fileExists(atPath: url.path)
        {
            return url
        }
        return bundle.url(forResource: "en", withExtension: nil, subdirectory: "docs")
    }

    /// Resolve an image path as written in topic markdown — e.g.
    /// `images/shading-legend-hours.png` — to its bundled URL.
    /// Image paths in the content are always relative to the
    /// `docs/` root (see README.md's authoring contract).
    public static func imageURL(forDocsRelativePath path: String) -> URL? {
        bundle.url(forResource: "docs/" + path, withExtension: nil)
    }
}
