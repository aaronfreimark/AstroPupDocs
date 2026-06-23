---
id: blink
title: AstroPup Blink Guide
---

# AstroPup Blink

AstroPup Blink triages a whole night of astrophotography subs at
once.  Drop a folder of **FITS** or **XISF** frames on the app and it
measures every one — star count, FWHM, eccentricity, SNR — flags the
clouded-out, soft, and trailed frames automatically, and gives you a
filmstrip to confirm the verdicts at full resolution.  When you're
done, one click moves the rejects out of your stack.

## Blink a night

Drop a capture folder onto the dock icon or the launch window — or
pick one with **File ▸ Blink…** (⇧⌘O).  Blink scans the folder and
its subfolders, skipping calibration frames (flats, darks, biases)
automatically.

A few things worth knowing about the scan:

- Results persist in a small JSON file
  (`astropup-view-scan.json`) right next to your subs — visible,
  human-readable, and yours to script against.  Re-opening the same
  folder later skips every frame that hasn't changed, so a second
  visit is instant.
- Dropping a **handful of files** (more than five) instead of a
  folder opens a review of exactly those frames — your good/bad
  calls are remembered for the folder either way.
- A single image opens in the plain viewer, just like AstroPup View —
  open a flat there and you get the same dust analysis (dust motes and
  their distance from the sensor).

## The review window

When the scan finishes you get the triage surface: charts across the
top, the acquisition timeline beneath them, and the filmstrip filling
the rest.

![The review window: the All/Good/Bad and filter pickers in the toolbar, the night-by-night timeline, and the filmstrip](images/blink/timeline.png "A multi-night M64 run — 329 subs, 5 flagged")

- The :sf:photo.stack: **All / Good / Bad** picker in the toolbar
  narrows the strip to the frames you're judging, with live counts
  for each.
- The :sf:camera.filters: **filter picker** appears when the night
  spans filters — L, R, G, B and narrowband chips, colour-coded the
  way astro filters usually are.  (One-shot-colour sets skip it.)
- **Charts** plot each metric's distribution with the rejection
  threshold drawn on top.  **Drag a threshold** to cull more or
  fewer frames; the strip updates live.  An **Auto** badge marks
  thresholds Blink tuned itself.
- The **timeline** maps the night hour by hour — every sub is a dot,
  rejects are crossed out, and a click jumps the filmstrip there.

![Two metric charts: a hand-set star-count threshold flagging six subs, and an auto-tuned FWHM threshold](images/blink/charts.png "Drag a threshold to cull more or fewer")

## The preview

Click any thumbnail for a full-resolution preview with the file's
header and measurements alongside:

![The preview window: the Analysis sidebar beside a full-resolution frame with a bright trail across it](images/blink/preview.png "A trailed frame, flagged by its eccentricity")

- **← / →** step through the night without leaving the keyboard.
- **X** flags or un-flags the current frame.
- **Space** or **Esc** closes the preview.

The sidebar's **Analysis** tab shows exactly why a frame was flagged
— the measured value sits next to the threshold that caught it.

## Good, bad, and your call

Automatic flagging starts from the **detection sensitivity** in
Settings: *Gentle* (the default) catches the clear failures, 
*Aggressive* also flags marginal frames, and *Off* leaves the
judging entirely to you.  Thresholds are tuned per filter, and a
frame with no detectable stars at all is flagged regardless.

Your manual call always wins: a frame you flag (or rescue) by hand
stays that way through rescans and threshold changes.

## Move the bad frames

The :sf:trash: toolbar button moves every flagged frame out of the
stack in one step — to the **Trash** (the default, recoverable) or
into a **Rejected** subfolder beside your subs, per Settings.  Blink
asks before it moves anything, and a rescan never resurrects what
you've culled.

## Acquisition summary

The :sf:list.bullet.clipboard: toolbar button opens a per-night,
per-filter table — date, sub length, and All / Bad / Good counts,
with your total good integration time at the bottom.  **Copy** puts
it on the clipboard as a tab-separated table, ready for AstroBin's
acquisition fields or a spreadsheet.

![The acquisition summary: per-night, per-filter rows of date, duration, and All / Bad / Good counts](images/blink/summary.png)

Dates are observing nights: frames shot after midnight stay with the
evening they began.

## Settings

![The Settings window: detection sensitivity, good and bad marks, and the bad-frame destination](images/blink/settings.png)

- **Detection sensitivity** — Off / Gentle / Aggressive, described
  above.  Changing it offers to re-tune any open scans.
- **Good and bad marks** — pick the emoji Blink uses for keepers and
  rejects.
- **Move bad frames to** — Trash or the Rejected subfolder.

## Quick Look

Blink also gives Finder proper previews: press space on any FITS or
XISF file for a stretched, full-quality preview with the header a
click away — no need to open the app at all.
