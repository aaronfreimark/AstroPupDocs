---
id: view
title: AstroPup View Guide
---

# AstroPup View

AstroPup View opens the files your astrophotography rig actually
produces — **FITS** and **XISF** — right on your iPhone or iPad.  It
reads the full image and its header, applies the same automatic
screen stretch you'd reach for on the desktop, and lays out
everything the file knows about the night it was captured.

## Opening an image

![The home screen: recent FITS files below the AstroPup View title card](images/view/launch.png)

The home screen is a standard document browser: **Recents** shows
what you've opened before, and **Browse** reaches the Files app —
iCloud Drive, On My iPhone, or any connected file provider.  Tap a
FITS or XISF file and it opens full-screen.

On first launch a sample image is copied into the app's Documents
folder, so there's something to explore before your own subs arrive.

View opens single images one at a time.  Most files from a capture
session work as-is: lights, calibrated masters, and finished,
already-stretched results.

## The viewer

![A monochrome sub frame open in the viewer](images/view/viewer.png)

- **Pinch to zoom**, or double-tap to jump between fit and 100%.
- The :sf:lightbulb: **stretch control** switches between
  **Stretched** and **Linear**.  A linear sub gets an automatic
  screen stretch (the same midtones transfer PixInsight's STF uses),
  so a dark frame becomes inspectable in one tap.  View detects
  images that are already stretched and leaves them alone.
- :sf:square.and.arrow.up: **exports** the current view as a regular
  image you can share.

## Image info

![The info sheet: target details, a star chart of the pointing, and observatory information](images/view/info.png)

Tap :sf:info: (iPhone) or open the sidebar (iPad) for everything the
file's header declares, in two tabs.

### FITS Header

- **Frame type** — Light, Flat, Dark, or Bias, read from the header.
- **Target** — object name, exposure, the filter (colour-coded the
  way astro filters usually are: red for R or SII, green for G,
  deep red for Ha, teal for OIII…), and the observation date and
  time.
- **Star chart** — a target-centred chart with RA/Dec gridlines,
  drawn around the image's pointing.  Tap **RA** or **Dec** to
  toggle between sexagesimal and decimal degrees.
- **Observatory** — camera, telescope, and a map of the capture
  site when the header records its coordinates.
- **Image** — dimensions, channels, bit depth, and file size.

### Analysis

![The Analysis tab: stars, FWHM, eccentricity, and SNR for the open frame](images/view/analysis.png)

The Analysis tab measures the frame the first time you open it:

- **Stars** — how many stars detection found.
- **FWHM** — star size in pixels; lower is tighter focus.
- **Eccentricity** — star roundness; higher values suggest
  trailing or guiding trouble.
- **SNR** — signal-to-noise of the detected stars.

These are raw measurements of the open file — handy for judging a
single sub on the spot.  (For triaging a whole night of subs at
once, that's our Mac app **AstroPup Blink**.)

## Dust analysis

Open a **flat** and View checks it for dust.  Dust on the sensor window,
a filter, or another surface casts a soft, out-of-focus shadow — a faint
"donut" — across a flat frame.  View finds those shadows, measures each
one, and uses the focal ratio from the header to work out **how far the
dust sits in front of the sensor**.

![The Dust Analysis tab: dust shadows grouped into surfaces by distance, each ringed on the flat in its own colour](images/view/dust.png "Two dusty surfaces — a filter near 10 mm and glass around 24 mm out")

Because every glass surface sits at a fixed distance, its dust casts
shadows of one characteristic size — so View groups what it finds into
**surfaces**, each shown in its own colour:

- The **Dust Analysis** tab lists those surfaces by distance from the
  sensor, with a shadow count for each, so you know *which piece of glass
  to clean*.  Roughly 1–2 mm is the sensor window; larger distances point
  to a filter or further out in the optical path.
- Each shadow is **ringed on the image** in its surface's colour — the
  switch beside the heading turns the rings on and off.

Open a flat with dust and View goes straight to this tab and fits the
whole frame, so the rings are there at a glance.  It flags the clear,
confident donuts rather than every faint speck — a few per surface is all
it takes to pin down the surface.

This needs a flat (`IMAGETYP = Flat`) whose header records the focal ratio
(`FOCRATIO` / `FNUMBER`) and the pixel size — NINA and most capture
software write these.  It works the same when you open a single flat in
**AstroPup Blink**.

## The More menu

**More…** on the home screen collects the rest:

- **Documentation** — this guide.
- **Release Notes** — what changed, version by version.
- **Send Feedback** — email us; the subject line carries the app
  version so we know what you're running.
- **AstroPup** — the AstroPup site, with the whole family of apps.
