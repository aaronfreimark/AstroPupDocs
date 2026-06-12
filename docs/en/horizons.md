---
id: horizons
title: Horizon files
order: 20
apps: sky, horizon
---

# Horizon files

A horizon file is a 360° profile of the trees, hills, and rooftops
around your observing site — the *real* skyline, not the ideal flat
horizon.  Once a site has one, AstroPup plans against what you can
actually see.

## What changes when a site has a horizon

- **Altitude charts** in the object detail sheet shade the region
  below your skyline, so you can see exactly when a target clears
  the trees and when it drops behind them.
- **Chart shading** (Hours above horizon, Rises, Sets) counts only
  time spent above your real horizon.  A target that's technically
  "up" but hidden behind a ridge isn't counted as visible.
- **Tonight's visibility** in the Targets list reflects the same
  rule, so the sort by visible hours puts genuinely observable
  targets first.

## Capturing a horizon

Horizons are captured with **AstroPup Horizon**, a companion app.
Stand at your observing spot, and it uses the camera and motion
sensors to trace the skyline as you sweep the phone around the
compass — about a minute of pointing at treetops.

The result is saved with your site and syncs through iCloud, so a
horizon captured on your phone appears automatically in AstroPup Sky
on every device signed into the same iCloud account.

## Sites without a horizon

No horizon file means AstroPup assumes a flat, unobstructed horizon
in every direction — fine for a dark-sky field, optimistic for a
backyard.  You can also set a simple **minimum altitude** in
Settings → Chart, which raises the working horizon uniformly (for
example, ignore everything below 20°) without capturing a profile.

## Editing or removing

A site's horizon comes from its capture in AstroPup Horizon —
re-capture there to update it.  Deleting the site's horizon restores
flat-horizon planning; the change appears in Sky within a few
seconds via iCloud.
