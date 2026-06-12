# Adding documentation to an AstroPup app

Instructions for giving an AstroPup app (View, Blink, Horizon, …)
an in-app Documentation page backed by this repo.  **AstroPup Sky
is the reference implementation** — when in doubt, do what Sky
does.  Read `README.md` first; it defines the authoring contract
this document assumes.

## 1. Write the page

Author `docs/en/<app>.md` (slug = lowercase app name: `view`,
`blink`, `horizon`).  `docs/en/sky.md` is the model: walk the
screen top to bottom, then follow the taps deeper, with a
screenshot for each major section.

- **Namespace your images.**  Each app's screenshots live in a
  per-app subfolder named for its slug — Sky's are under
  `images/sky/`, yours go under `images/<app>/`.  Only the
  shared SF Symbol glyphs (`images/sf/`) sit outside the per-app
  folders.
- Screenshots: dark-mode iPhone captures, ≤ 1200 px on the long
  side after downscaling, roughly ≤ 200 KB each.
- Inline SF Symbols (`:sf:symbol.name:`) need their PNG committed
  at `docs/images/sf/<symbol.name>.png` — generate with
  `swift scripts/sfrender.swift <symbol> <out.png>`.  Symbols
  already rendered for Sky are reusable as-is.
- **Describe shipped behavior only.**  The astropup.app website
  publishes `main` within minutes of a push (see WEBSITE.md), so
  a page describing an unreleased feature goes public the moment
  it merges.

Commit, then tag the next semver version (`git tag 0.4.0 && git
push origin main 0.4.0`) — apps pin tags, never `main`.

## 2. Integrate the package

Add this repo as a Swift package dependency:
`https://github.com/aaronfreimark/AstroPupDocs`, *Up to Next
Major* from the tag you just cut.  (During iteration you can use
a local path dependency to `../AstroPupDocs` and switch to the
remote pin before release — Sky's commit history shows both
steps.)

The package provides everything but chrome:

- `DocumentationPageView(app: "<slug>")` — the shared scrolling
  renderer.  Wrap it in your app's own NavigationStack, title
  ("Documentation"), and dismiss affordance.  Sky's
  `Views/DocumentationView.swift` is the whole pattern in ~25
  lines.
- Add a "Documentation" entry to the app's menu (Sky uses a
  `book` icon in the More menu, above Credits).

## 3. Add the contract tests

Copy Sky's `AstroPup SkyTests/DocumentationContentTests.swift`
(suite `DocumentationBundledContentTests`) into the app's test
target and change the slug.  Four tests, all against the page the
app actually bundles:

1. the page loads and its front-matter `id` matches the slug,
2. every referenced image resolves in the bundle,
3. every `:sf:` token is a valid SF Symbol on the app's minimum
   OS **and** has its website PNG committed,
4. the page avoids forbidden syntax (tables, raw HTML, inline
   images).

These tests are what make the version bump safe: when the app
later adopts a newer docs tag, a missing image or bad token fails
the build instead of shipping.

## 4. Release coupling

The app's `Package.resolved` is its docs pin.  Docs edits land
here freely; the app picks them up by bumping the pinned version
(File → Packages → Update to Latest Package Versions) on its own
release schedule.  Remember "Documentation" is a user-facing
string — include it in the app's next localization sweep.
