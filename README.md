# AstroPupDocs

Single source of truth for AstroPup user documentation, consumed by:

- **The AstroPup apps** (iOS) — as a Swift package dependency.  The
  package carries the content (via `Bundle.module`), the canonical
  contract parser (`DocumentationContent`), and the shared SwiftUI
  renderer (`DocumentationPageView`); each app contributes only its
  slug and its sheet chrome.  Regenerate SF Symbol PNGs with
  `swift scripts/sfrender.swift <symbol> <out.png>`.
- **astropup.app** (web) — as a git submodule; the site reads
  `docs/` directly and renders each app's page.

One commit here updates every surface: apps pick it up at their next
release (bump the pinned package version), the website at its next
deploy.

## Layout

**One page per app.**  Each app's entire guide is a single markdown
file, named for the app:

```
docs/
  en/
    sky.md            ← AstroPup Sky
    view.md           ← AstroPup View
    blink.md          ← AstroPup Blink
    horizon.md        ← AstroPup Horizon
  de/ … fr/ …         ← optional per-locale folders; consumers fall
                        back to en/ for missing locales or pages
  images/             ← screenshots shared by all locales
```

Structure *within* a page comes from `##` / `###` sections — both
renderers display them as headed sections of one scrolling document.

## Authoring contract

Both renderers — `AttributedString(markdown:)` on iOS and
react-markdown on the web — must handle every file, so the format is
deliberately narrow.  A page that violates these rules will render
incorrectly in at least one consumer.

1. **CommonMark subset only.**  Allowed: `#`/`##`/`###` headings,
   paragraphs, `-` bullet lists, **bold**, *italic*, `inline code`,
   and links.  Not allowed: tables, raw HTML, footnotes, MDX or
   shortcodes of any kind.
2. **Images are block-level only** — `![alt text](images/file.png)`
   alone on its own line, never inline mid-sentence.  Alt text is
   required (it becomes the accessibility label in the apps and the
   `alt` attribute on the web).  An optional **caption** uses the
   standard markdown title syntax —
   `![alt](images/file.png "Visible caption")` — rendered as small
   secondary text beneath the image in the apps and as a
   `figcaption` on the web.
3. **Image paths are relative to the `docs/` root** — always
   `images/<name>.png`, regardless of which locale folder the page
   lives in.  `images/` is shared by every app's page: each
   app's screenshots live in a per-app subfolder named for its
   slug — `images/sky/weather-strip.png`,
   `images/view/<name>.png`, … — alongside the shared
   `images/sf/` symbol glyphs.
4. **Image files**: ≤ 1200 px on the long side, compressed (PNG for
   UI screenshots is fine; keep each file roughly ≤ 200 KB).  They
   ship inside the app binaries.
5. **Inline SF Symbols** — the one extension beyond CommonMark.
   `:sf:symbol.name:` inline in a paragraph or bullet renders the
   native SF Symbol in the apps; the website replaces the token
   with `<img>` of the matching pre-rendered glyph at
   `images/sf/<symbol.name>.png` (white on transparent, sized for
   dark backgrounds).  Two rules: use sparingly — only where the
   text names a button the reader must find — and every symbol
   used must have its PNG committed (regenerate with AppKit's
   `NSImage(systemSymbolName:)`; the apps' contract tests fail on
   missing files).
6. **Front matter** opens every page:

   ```
   ---
   id: sky                  ← the app slug; matches the filename
   title: AstroPup Sky Guide
   ---
   ```

   Keys are simple `key: value` lines — parseable by gray-matter on
   the web and a hand-rolled scanner on iOS.  Don't use YAML lists,
   nesting, or quoting.

## Releasing

Tag releases semver-style (`0.1.0`, `0.2.0`, …).  Each app pins a tag
in its package dependencies — content edits land on `main` freely,
and an app adopts them by bumping its pinned version on its own
release schedule.  Write pages to describe **shipped** behavior;
documentation for a new feature lands in the same docs version that
the feature's app release pins.
