# AstroPupDocs

Single source of truth for AstroPup user documentation, consumed by:

- **AstroPup Sky** and **AstroPup Horizon** (iOS) — as a Swift
  package dependency; the `docs/` tree ships inside each app via
  `Bundle.module` and renders in the in-app Guide.
- **astropup.app** (web) — as a git submodule; the site reads
  `docs/` directly and renders each topic as a page.

One commit here updates every surface: apps pick it up at their next
release (bump the pinned package version), the website at its next
deploy.

## Layout

```
docs/
  en/                 ← topics, one markdown file each
    shading-modes.md
    horizons.md
  de/ … fr/ …         ← optional per-locale folders; consumers fall
                        back to en/ for missing locales or topics
  images/             ← screenshots shared by all locales
```

## Authoring contract

Both renderers — `AttributedString(markdown:)` on iOS and
react-markdown on the web — must handle every file, so the format is
deliberately narrow.  A topic that violates these rules will render
incorrectly in at least one consumer.

1. **CommonMark subset only.**  Allowed: `#`/`##`/`###` headings,
   paragraphs, `-` bullet lists, **bold**, *italic*, `inline code`,
   and links.  Not allowed: tables, raw HTML, footnotes, MDX or
   shortcodes of any kind.
2. **Images are block-level only** — `![alt text](images/file.png)`
   alone on its own line, never inline mid-sentence.  Alt text is
   required (it becomes the accessibility label in the apps and the
   `alt` attribute on the web).
3. **Image paths are relative to the `docs/` root** — always
   `images/<name>.png`, regardless of which locale folder the topic
   lives in.
4. **Image files**: ≤ 1200 px on the long side, compressed (PNG for
   UI screenshots is fine; keep each file roughly ≤ 200 KB).  They
   ship inside both app binaries.
5. **Front matter** opens every topic:

   ```
   ---
   id: shading-modes        ← stable identifier; never changes once
                              shipped (used for deep links)
   title: Chart shading modes
   order: 10                ← topic-list sort key; gaps of 10 leave
                              room for insertions
   apps: sky                ← which apps show the topic: `sky`,
                              `horizon`, or `sky, horizon`
   ---
   ```

   Keys are simple `key: value` lines — parseable by gray-matter on
   the web and a hand-rolled scanner on iOS.  Don't use YAML lists,
   nesting, or quoting.

## Releasing

Tag releases semver-style (`0.1.0`, `0.2.0`, …).  The apps pin a tag
in their package dependencies — content edits land on `main` freely,
and an app adopts them by bumping its pinned version.
