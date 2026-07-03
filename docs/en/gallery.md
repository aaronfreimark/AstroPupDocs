---
id: gallery
title: AstroPup Gallery Documentation
---

# AstroPup Gallery

AstroPup Gallery turns your existing astrophotography folders into a
browsable, plate-solved catalog — every target, every night, every
filter — mapped onto the real sky.  Point it at an imaging folder and the gallery fills in.
It includes special handling for archives that
live in Dropbox or iCloud as online-only files: Gallery catalogs
from filenames and metadata, so it never downloads all your raw subs.


This page starts with how a scan turns your files into a catalog,
then tours each part of the window.

## How a scan works

Each capture in your archive becomes one image in the gallery.
Here is where its facts come from, in the order Gallery gathers
them:

- **Names and structure, first and free.**  Sub filenames and the
  folders around them carry the target name, filter, exposure, and
  capture dates.  This pass reads no file contents, so it costs
  nothing — even against a fully online-only archive.
- **The WBPP log is the referee.**  When PixInsight's log is
  present, Gallery takes its accepted-and-rejected verdict as the
  truth: integration time counts only the subs that survived
  stacking, not everything you captured.
- **One sub's header fills the gaps.**  A single raw frame's FITS
  header supplies what filenames can't: your telescope, camera, and
  pixel size — and the mount's recorded *pointing*, the actual sky
  coordinates the frame was taken at.
- **One preview represents the capture.**  Gallery picks the best
  processed image in the folder (you can override it with **Change
  Preview**), stores a small copy, and hands it to the plate
  solver.

The metadata then *seeds* the plate solve.  A solver works far
faster and more reliably when told roughly where to look, so
Gallery hints it with the header pointing when it has one, or the
named target's catalog position when it doesn't — plus a field-size
estimate from your optics.  Images with no usable hint get a
slower, blind attempt at the end of the queue.

A successful solve returns the image's exact footprint on the sky —
center, scale, and rotation.  From that footprint Gallery
identifies what the image actually shows: every catalog object
inside the frame is found geometrically, the name your files
carried is confirmed (or flagged as **Mistagged** if it lies
outside the frame), and the in-frame objects become the image's
tags.  That's how a frame you shot for one nebula also gets
credited with the little galaxies photobombing the corner.

## Sources

![The Sources list: a Dropbox archive with a dotted cloud folder icon and three external-drive folders, each with captured and integrated counts, scan dates, and Rescan buttons, above a log of recent scan activity](images/gallery/sources.png "Each source shows where it lives, what it holds, and when it was last scanned.")

A *source* is a folder Gallery watches — your imaging archive, or
any part of it.  Click **Scan Folder** and choose the top of your
capture tree; Gallery scans it and builds the catalog.

- **Scanning is download-efficient.**  The scan reads filenames and
  folder structure without downloading anything.  To learn more
  about each capture it then fetches a small, bounded set: the WBPP
  logs, one raw sub frame, and one preview image per capture.  If
  your archive is in the cloud, Gallery returns each downloaded file
  to online-only after reading it, so your disk footprint doesn't
  grow.
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

Gallery doesn't require any particular folder or file naming.  It
works best when each capture keeps three things together, wherever
they came from: the **raw subs**, the **WBPP log** from stacking,
and a **processed image**.  If a target's name is a nickname the
catalog doesn't know, the **My Objects** tab in Settings maps it to
a real object once, permanently.

## Plate Solving

![The Plate Solving utility showing the solver and star database ready, a 30-day success tally, and a log of recent solves — successes with their scale and the other objects found in frame, failures marked with warning triangles](images/gallery/plate-solving.png "The solver's health and history — a successful solve lists the other objects it found in the frame.")

Gallery plate-solves every image's preview automatically in the
background — no setup.  The solver (ASTAP) is built in; its star
database (about 500 MB) downloads once, on the first solve.

- Solves are *seeded* by your FITS header pointing or the target's
  catalog position, which makes them fast and reliable.  Anything
  left unhinted gets a slower blind attempt afterward.
- **Plate Solving** :sf:star.bubble: in the sidebar shows
  readiness, what's solving right now, and a log of every success
  and failure with the full solver transcript.
- A few images may never solve — heavily processed, starless, or
  strongly drizzled finals can defeat any solver.  **Change
  Preview** with a cleaner export usually fixes it; the rest are
  simply left unsolved, and everything else about them still works.

## Objects

![The Objects browser listing clusters and nebulae with favorite stars and imaged badges beside the designations, filtered by a search for sh2](images/gallery/objects.png "The whole catalog, marked with what you've captured.")

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

## Sky Chart

![The Sky Chart showing four image footprints around the Veil Nebula complex, each filled with its photograph, over real survey imagery](images/gallery/sky-chart.png "Every solved image, in its true place on the sky.")

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
- The **My Images** toggle — :sf:rectangle.dashed: hides your
  footprints, :sf:photo: shows them.
- **Zoom** with :sf:plus: and :sf:minus:, or
  :sf:square.arrowtriangle.4.outward: to fit the whole sky.
- The background survey (DSS2 color, Hydrogen-alpha, infrared, and
  more) and the projection are chosen in Settings.

## Gallery

![The gallery showing a grid of deep-sky images, each with its name and year beneath, a solved badge in its corner, and the sidebar's collections alongside](images/gallery/gallery.png "Each card is one processed image — one target, one session.")

The main view is your images, newest first.  Each card is a
*processed image*: one target from one session, showing its best
available picture.

- **Zoom with the toolbar :sf:plus: and :sf:minus: buttons** — they
  change how many images fit per row.  The sizes adapt live as you
  resize the window or show and hide the panels.  One step past the
  smallest size collapses the grid into a **by-year overview**.
- **Arrow keys walk the selection** — left and right continue past
  the ends of rows — and the view scrolls to follow.  Press
  **Space** or double-click to open the image full-window; hover
  over it there to reveal the objects annotated in the frame.
- **Hover over any card** to see the whole image letterboxed
  instead of cropped.
- A small :sf:star.bubble: badge marks a plate-solved image;
  mosaics show a panel count.

The sidebar's collections slice the same images: **Recent**,
**Unsolved**, **Untagged**, **Mistagged** (a name that contradicts
the plate solve), **No Image** (sessions with no usable preview),
and **Mosaics**.  Right-click any card for the full command menu —
open, reveal in Finder, rename, tag, solve, change preview, or
remove.

## The inspector

![The Pleiades open full-window with its stars and nebulae annotated in yellow, and the inspector beside it showing the capture's name, dates, equipment, and solve details](images/gallery/inspector.png "The inspector beside the full-window view — hover over the image to reveal every object the solve identified.")

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

The :sf:gearshape: menu holds the rest: **Rename** (a custom name
that survives rescans), **Re-solve**, **Change Preview** (pick a
better image file if the automatic choice was wrong — it re-solves
automatically), and **Rescan Folder**.

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

- **Keep each capture's subs, WBPP log, and a finished image
  together.**  That's all Gallery needs — the subs carry the
  metadata, the log settles the integration time, and the finished
  image becomes the preview and the plate solve.
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
