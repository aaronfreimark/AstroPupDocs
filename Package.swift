// swift-tools-version: 5.9

// AstroPupDocs — the single source of truth for AstroPup user
// documentation, shared between AstroPup Sky, AstroPup Horizon,
// and the astropup.app website.
//
// Layout:
//
//   docs/<locale>/<topic>.md   — one markdown file per topic, with
//                                front matter (see README.md for the
//                                authoring contract)
//   docs/images/…              — screenshots referenced by topics
//
// The `docs/` tree lives at the REPO ROOT (not inside Sources/) so
// the website can consume this repo as a plain git submodule and
// read `docs/` directly, without caring that it is also a Swift
// package.  The target below reaches up to the root via `path: "."`
// and copies `docs/` into the resource bundle verbatim, so iOS
// consumers see the identical tree via `Bundle.module`.
import PackageDescription

let package = Package(
    name: "AstroPupDocs",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
    ],
    products: [
        .library(name: "AstroPupDocs", targets: ["AstroPupDocs"]),
    ],
    targets: [
        .target(
            name: "AstroPupDocs",
            path: ".",
            exclude: ["README.md", "WEBSITE.md", "Tests", "scripts"],
            sources: ["Sources"],
            resources: [.copy("docs")]
        ),
        .testTarget(
            name: "AstroPupDocsTests",
            dependencies: ["AstroPupDocs"],
            path: "Tests"
        ),
    ]
)
