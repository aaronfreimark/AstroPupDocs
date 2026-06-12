---
id: horizon
title: AstroPup Horizon Documentation
---

# AstroPup Horizon

AstroPup Horizon records the real skyline at your observing site —
trees, rooftops, and all.  Sweep your phone around the horizon
once; the app traces the silhouette with machine learning, lets you
fix it by hand, and exports it to your planetarium software.
Horizons sync automatically to **AstroPup Sky**, where they shade
its sky chart.

On iPad the same tools are arranged for the larger screen: your
horizons live in a sidebar on the left, and the selected horizon
fills the panel beside it.

## Your horizons

![The home screen: a list of captured horizons, each with a small polar thumbnail and capture date](images/horizon/horizons-list.png)

The home screen lists every horizon on your iCloud account:

- **Horizons** — ready to use and export.  The circular thumbnail
  is the horizon itself; the :sf:pano: glyph marks a saved
  panorama.
- **Needs Analysis** — saved captures awaiting analysis.  Tap one
  to run it.
- **Missing Horizons** — sites without a capture yet, usually
  created in AstroPup Sky.  Open one and tap **Add Horizon**.

Swipe or long-press a row to **Rename** or **Delete**.  Deleting
removes the site from every AstroPup app, so the app asks first.

The camera button in the top-right starts a new capture; **Tips**
in the top-left reviews the advice for a clean one.

## Capturing a horizon

A capture is a single slow turn in place — about a minute, start to
finish.

![The figure-8 calibration prompt with the compass accuracy meter](images/horizon/capture-calibration.png)

![The Start Capture button over the live camera view](images/horizon/capture-start.jpg)

1. **Calibrate the compass.**  Wave the phone in a figure-8 until
   the accuracy meter fills.  The horizon's compass alignment is
   only as good as this step, so it's worth a few seconds of
   patience.  If the compass can't settle — common indoors or near
   steel — a **Capture with imperfect calibration** option appears
   after thirty seconds so you're never stuck.
2. **Tap Start Capture and turn.**  Rotate slowly in place, holding
   the phone upright and roughly level, keeping the skyline in
   frame.  A flag planted where you started waits for your return,
   and a circular gauge tracks your progress around the circle.
3. **Finish the loop.**  When you've come full circle the capture
   stops by itself — green check, done.  Analysis starts
   immediately.

![The checkered finish flag planted at the start position, with the rotation gauge nearly complete](images/horizon/capture-finish.jpg "Coming back around: the checkered flag marks where you started")

A few habits make a visible difference: stand where you'd actually
set up the telescope, keep an even pace, and avoid leaning or
wandering as you turn.

## Analysis

After each capture the app processes the sweep on-device — nothing
is uploaded anywhere:

- **Compass refinement.**  If the sun appears in the panorama, its
  known position refines the compass heading, typically to within a
  degree or two.  A gray mark on this step just means the sun
  wasn't visible — capture still succeeds with the magnetometer
  heading.
- **Panorama stitching.**  The frames merge into one seamless
  wraparound image of your site.
- **Horizon detection.**  A depth-estimation model traces where sky
  meets terrain in every frame, and the traces merge into a single
  horizon line.

If the model can't find a horizon — a featureless overcast sky can
do this — the app says so and offers a choice: **Keep** the capture
to edit by hand or re-analyze later, or **Discard** it and try
again.

## The horizon detail page

![A horizon's detail page: panorama with the traced horizon line, a polar chart of the skyline, and Edit and Export buttons](images/horizon/horizon-detail.png)

Tap any horizon to see everything the capture produced:

- **The panorama**, with the traced horizon drawn over it.  Tap it
  to open the editor.
- **The chart** — swipe between two views of the same skyline: a
  graph of altitude by compass direction, and a polar plot that
  shows your whole sky the way Sky's chart does, north up.
- **Edit** and **Export** buttons for the two things you'll do
  most.
- **The capture location** on a map, with the coordinates below it
  — tap either value to copy it.

Tap the title to rename the horizon.  The :sf:ellipsis: menu holds the rest:

- **Reprocess** re-runs the analysis on the saved frames — useful
  after an app update improves detection.
- **Recapture Horizon** replaces the capture with a fresh sweep
  while keeping the site's name — for when the trees leaf out or
  the neighbor builds a fence.  If the new capture's location is
  far from the original, the app points that out before saving.
- **Delete** removes the horizon everywhere.

## Editing the horizon

![The horizon editor: panorama with the horizon line ready for hand correction](images/horizon/editor.png)

The detector is good, but your eyes are better.  The editor shows
the panorama full screen with the horizon line on top:

- **Pan mode** scrolls and zooms the panorama.  Pinch in until the
  app invites you to edit — point editing unlocks at closer zoom
  levels, where your finger has the precision to match.
- **Paint mode** :sf:scribble.variable: redraws the line: drag
  across the panorama and the horizon follows your finger.
- **Undo and redo** cover every stroke, and your editing history is
  saved with the horizon — closing the editor doesn't lose it.

Tap **OK** to save, or the :sf:xmark: to leave the line as it was.

## Exporting

![The export screen listing Stellarium, SkySafari, N.I.N.A., and Cartes du Ciel](images/horizon/export.png)

Tap **Export** on the detail page and choose your software.  Each
choice shows step-by-step installation instructions tailored to
that app, then shares the file in the right format:

- **AstroPup Horizon** — share the horizon bundle itself with
  another Horizon user, complete with its panorama and capture
  data.  Opening it on their device adds the site to their
  library.
- **Stellarium** — a complete landscape folder, with an option to
  include your panorama so Stellarium draws your actual site around
  the sky.
- **SkySafari for iOS** and **for Mac** — a panoramic horizon
  image, sized and positioned for SkySafari's settings.
- **N.I.N.A.** — a standard HRZ horizon file for the Framing
  assistant.
- **Cartes du Ciel** — an HRZ horizon file for its Observatory
  settings.

Don't see your software?  The export screen has a one-tap email to
suggest it.

## Working with AstroPup Sky

Horizon and **AstroPup Sky** share one library of observing sites
through iCloud Drive — look for the **AstroPup** folder in the
Files app.

- A horizon captured here appears in Sky automatically, where it
  shades the star chart and trims every rise, set, and visibility
  time to the sky your site actually has.
- A site created in Sky shows up here under **Missing Horizons**,
  ready for a capture on your next clear evening.

There's no setup and no export step — the same site list, on every
device signed into your iCloud account.

## Tips

- **Capture from the telescope's point of view.**  A few steps
  sideways can move a tree from blocking Polaris to missing it
  entirely.  Lift the telescope off its mount and capture standing
  right where it sits — the phone sees what the scope will see.
- **Take the calibration seriously.**  A compass error rotates the
  whole horizon — thirty extra seconds of figure-8s pays for itself
  every time Sky tells you when a target clears your roofline.
- **Recapture with the seasons.**  Bare branches in February and
  full canopy in July are different horizons.  **Recapture
  Horizon** keeps the site's name and history while replacing the
  skyline.
- **Let the editor fix the wires.**  Thin obstructions like power
  lines are easy to miss for the detector and easy to paint over by
  hand — zoom in and redraw that stretch in a few seconds.
