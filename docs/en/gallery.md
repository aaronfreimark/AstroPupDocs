---
id: gallery
title: AstroPup Gallery Documentation
---

# AstroPup Gallery

AstroPup Gallery turns your existing astrophotography folders into a
browsable, plate-solved catalog — every target, every night, every
filter — mapped onto the real sky.  It is built for archives that
live in Dropbox or iCloud as online-only files: Gallery catalogs
from filenames and metadata, so it never downloads your raw subs.
Point it at an imaging folder and the gallery fills in.

This page walks the window left to right — sidebar, gallery,
inspector — then through each utility.

## Sources

![The Sources list showing a Dropbox archive with a dotted cloud folder icon, scan dates, and image counts](images/gallery/sources.png "Each source shows where it lives and when it was last scanned.")

A *source* is a folder Gallery watches — your imaging archive, or
any part of it.  Click **Add Folder** and choose the top of your
capture tree; Gallery scans it and builds the catalog.

- **Scanning is download-free.**  The scan reads filenames, folder
  structure, and PixInsight WBPP logs, then fetches exactly one
  small preview per image.  The hundreds of raw subs and
  calibration frames are never downloaded — online-only files stay
  online-only.
- **Folder icons show where a source lives**: a dotted folder for
  cloud storage (Dropbox, iCloud, OneDrive), a filled folder for
  local and external drives, and a folder with a question mark when
  the source is offline (drive unplugged, cloud not mounted).
- **Rescans are incremental and safe.**  Gallery rescans
  automatically on launch and when a drive holding a source is
  connected (both optional, in Settings).  Unchanged sessions are
  skipped, so a rescan takes seconds.  Missing files are reported —
  never silently removed — and your renames, tags, and solutions
  always survive.

Sessions are recognized from folders named like
`2026-01-22 Rosette Nebula`, with light frames in N.I.N.A.'s
default naming underneath.  If your target names are nicknames the
catalog doesn't know, the **My Objects** tab in Settings maps them
to real objects once, permanently.

## The gallery

![The gallery grid showing five columns of deep-sky images with names and years beneath each](images/gallery/gallery-grid.png "Each card is one processed image — one target, one session.")

The main view is your images, newest first.  Each card is a
*processed image*: one target from one session, showing its best
available picture.

- **Zoom with the toolbar + and − buttons** — they change how many
  images fit per row.  The sizes adapt live as you resize the
  window or show and hide the panels.  One step past the smallest
  size collapses the grid into a **by-year overview**.
- **Arrow keys walk the selection** — left and right continue past
  the ends of rows — and the view scrolls to follow.  Press
  **Space** or double-click to open the image full-window; hover
  over it there to reveal the objects annotated in the frame.
- **Hover over any card** to see the whole image letterboxed
  instead of cropped.
- A small badge marks a plate-solved image; mosaics show a panel
  count.

The sidebar's collections slice the same images: **Recent**,
**Unsolved**, **Untagged**, **Mistagged** (a name that contradicts
the plate solve), **No Image** (sessions with no usable preview),
and **Mosaics**.  Right-click any card for the full command menu —
open, reveal in Finder, rename, tag, solve, change preview, or
remove.

## The inspector

![The inspector showing an image of the Monkey Head Nebula with solve details, in-frame objects, and filter totals](images/gallery/inspector.png "Everything Gallery knows about one image.")

Select an image and the inspector opens beside it.

- **The header** shows the picture, its name, capture dates, and
  the equipment read from your FITS headers.
- **The solve block** gives the image's true sky position: center
  coordinates, field size, pixel scale, rotation, and *how* it was
  solved (from the header pointing, a catalog hint, or blind).
- **In this frame** lists every catalog object the solved footprint
  contains — not just your target.  Click one to inspect it; click
  **Tag** to add your own.
- **Filters** totals your integration time per filter, taken from
  WBPP's accepted subs — the honest number, after rejection.
- **Sky Chart** frames this image on the chart; **Related images**
  jumps between sessions of the same target.

The action menu holds the rest: **Rename** (a custom name that
survives rescans), **Re-solve**, **Change Preview** (pick a better
image file if the automatic choice was wrong — it re-solves
automatically), and **Rescan Folder**.

## Plate solving

![The Plate Solving utility showing solver readiness, the star database, and a log of recent solves](images/gallery/plate-solving.png "The solver's health, history, and remaining work in one place.")

Gallery plate-solves every image's preview automatically in the
background — no setup.  The solver (ASTAP) is built in; its star
database (about 500 MB) downloads once, on the first solve.

- Solves are *seeded* by your FITS header pointing or the target's
  catalog position, which makes them fast and reliable.  Anything
  left unhinted gets a slower blind attempt afterward.
- **Plate Solving** in the sidebar shows readiness, what's solving
  right now, and a log of every success and failure with the full
  solver transcript.
- A few images may never solve — heavily processed, starless, or
  strongly drizzled finals can defeat any solver.  **Change
  Preview** with a cleaner export usually fixes it; the rest are
  simply left unsolved, and everything else about them still works.

## Sky Chart

![The Sky Chart showing image footprints scattered along the winter Milky Way, one selected in blue](images/gallery/sky-chart.png "Every solved image, in its true place on the sky.")

The Sky Chart draws every solved image as its actual footprint over
real survey imagery.  Zoom in and the footprints fill with your
photographs — warped to their true position, scale, and rotation on
the sky.

- **Click** a footprint to select it; when frames overlap, another
  click cycles the stack.  **Double-click** opens the inspector.
- The toolbar picks the pointer tool.  **Select** :sf:pointer.arrow:
  is the default.  **Identify** :sf:scope: looks up the catalog at
  any point — hover to preview the objects under the cursor, click
  to list them.  **Ruler** :sf:ruler: measures the sky: click two
  points for the angular distance between them; a third click
  starts a fresh measurement.
- The **My Images** toggle hides and shows your footprints; the
  zoom buttons and **Zoom to Fit** frame the view.
- The background survey (DSS2 color, Hydrogen-alpha, infrared, and
  more) and the projection are chosen in Settings.

## Objects

![The Objects browser listing galaxies and nebulae with favorite stars and imaged checkmarks](images/gallery/objects.png "The whole catalog, marked with what you've captured.")

**Objects** in the sidebar is the full deep-sky catalog — thousands
of galaxies, nebulae, and clusters — overlaid with *your* history:
which ones you've imaged, and which you've favorited.

- Filter to **favorites** :sf:star.fill: or **already imaged**
  :sf:photo.badge.checkmark.fill:; search by any designation or
  common name.
- Click an object for its inspector: position, size, kind, your
  images of it, and a notes field that's yours to keep.
- **Favorites sync with AstroPup Sky** in both directions, and the
  objects you've imaged fill Sky's *already imaged* list
  automatically — so Sky can hide what you've already shot when
  planning.  One iCloud account, no setup; the toggle is in
  Settings.
- **Continue on AstroPup Sky** hands the object you're viewing to
  your iPhone or iPad, plotted against your local horizon — the
  fastest answer to "is this up tonight?"

## Search

Click :sf:magnifyingglass: in the toolbar (or press **⌘F**) to
search everything at once — your images by name, and the catalog by
designation or common name.  Choosing a catalog object jumps to it
in the Objects browser or on the chart.

## Settings

- **General** — automatic rescans, how images are named (folder
  name, file name, or target), the AstroPup Sky sync toggle.
- **Sky Chart** — zoom gesture direction, projection, and the
  background survey.
- **My Objects** — your personal name mappings.  If you shoot
  "Pac-Man" and want it cataloged as NGC 281, add the link once
  here; every past and future scan honors it.

## Tips

- **Name folders with the date and target** —
  `2026-02-11 M 81` — and Gallery gets everything else on its own.
- **Trust the rescan.**  It never overwrites your work: custom
  names, tags, chosen previews, favorites, notes, and plate
  solutions all survive, and anything destructive is reported
  first.
- **A wrong auto-preview is a right-click away** from fixed —
  **Change Preview** accepts any image file in the session folder.
- **Quick Look works on rigs**: Gallery writes a `.rig` file per
  optical train it discovers (in iCloud Drive, beside your
  `.horizon` sites) — press Space on one in Finder to see the
  train sketched to scale.
