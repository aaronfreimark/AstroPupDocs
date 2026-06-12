# Integrating AstroPupDocs into astropup.app

Instructions for adding the AstroPup user documentation to the
website.  This repo is the single source of truth shared with the
iOS apps; the site renders the same markdown.  Read `README.md`
first — it defines the authoring contract this document assumes.

## What to build

One page per app at `/docs/:app` (e.g. `/docs/sky`), rendering
`docs/en/<app>.md` from this repo.  Apps today: `sky`; coming:
`view`, `blink`, `horizon`.  Render only pages whose file exists —
don't hardcode the list.  Link the pages from wherever app
documentation naturally belongs in the site's navigation.

## Getting the content

Add this repo as a **git submodule** of the site (any path; the
content lives in its `docs/` directory).  The submodule pin is the
site's docs version — bump it deliberately, the same way each iOS
app bumps its pinned package version.

Build pipeline notes (the site deploys via AWS Amplify):

- `amplify.yml` preBuild needs `git submodule update --init` before
  `npm ci`.
- **If this repo is private**, the Amplify build container cannot
  clone it without credentials.  Either make this repo public, or
  store a GitHub token in an Amplify environment variable and add,
  before the submodule update:

  ```
  git config --global url."https://${GITHUB_TOKEN}@github.com/".insteadOf "https://github.com/"
  ```

- The `docs/` tree (markdown + images) must end up in the deployed
  artifacts so images serve at a stable URL — copy it into the Vite
  public assets (e.g. to `public/docs/`) during the build, or add a
  small Vite plugin.  Everything below assumes images serve from
  `/docs/images/…`.

## Rendering the contract

Use **react-markdown** (or equivalent).  The format is a deliberately
narrow CommonMark subset (see README.md), so no plugins are needed
beyond the three custom behaviors:

1. **Front matter.**  Every page opens with a `---` fenced block of
   simple `key: value` lines (`id`, `title`).  Strip it before
   handing the body to react-markdown; `title` is the page
   `<title>`/heading context.  gray-matter works, but a ten-line
   scanner is fine — the contract forbids YAML lists, nesting, and
   quoting.

2. **Image captions.**  Block images may carry a caption via the
   standard markdown *title* syntax:
   `![alt](images/file.png "Visible caption")`.  Render as
   `<figure><img …><figcaption>Visible caption</figcaption></figure>`.
   react-markdown surfaces the title on the `img` node — map the
   `img` component to a figure when `title` is present.  Image
   `src` values are docs-root-relative (`images/<name>.png`);
   prefix to wherever the docs tree is served (e.g.
   `/docs/images/<name>.png`).  Alt text is always present per the
   contract — keep it on the `img`.

3. **Inline SF Symbols.**  `:sf:symbol.name:` appearing inline in
   paragraphs or bullets is the contract's one extension beyond
   CommonMark.  Replace each token with an inline image of the
   pre-rendered glyph:

   ```html
   <img src="/docs/images/sf/symbol.name.png" alt="" class="…" />
   ```

   Token pattern: `:sf:([a-z0-9.]+):`.  Simplest approach: regex-
   replace tokens with `<img>` markdown/HTML before rendering, or
   use a small remark plugin.  The PNGs are white on transparent,
   sized for dark backgrounds; render at roughly 1em height,
   vertically aligned with the text (`vertical-align: -0.125em`
   or similar).  Every token used in a page has its PNG committed
   at `docs/images/sf/<symbol.name>.png` — the iOS apps' contract
   tests enforce this, so a missing glyph is a bug here, not there.

## Styling expectations

- The screenshots are dark-UI iPhone captures and the SF glyphs are
  white — these pages want a dark background.
- Images are ≤1200px wide; the iOS renderer shows them full-column
  width with rounded corners and small, secondary-colored captions.
  Match the site's own aesthetic rather than the app's, but keep
  captions visually subordinate.
- Headings: pages use `#` once (the page title), `##` for major
  sections, `###` for subsections.  Generous spacing above `##`
  sections helps scanning — the iOS renderer does the same.

## Updating

Content changes land on this repo's `main` freely and are tagged
semver-style for the iOS apps.  The site adopts by bumping the
submodule pointer and redeploying.  No site code change is needed
for content-only updates; new apps appear by routing to the new
page file.
