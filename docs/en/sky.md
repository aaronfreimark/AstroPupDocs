---
id: sky
title: AstroPup Sky Documentation
---

# AstroPup Sky

AstroPup Sky plans tonight's deep-sky imaging session: a full-disc
star chart of your sky, shaded by when targets are visible from
*your* observing site — local horizon, weather, and all.

## Chart shading modes

The sky chart can tint the background so you can answer one planning
question at a glance.  Pick the mode from the shading button in the
toolbar; a legend at the bottom of the chart explains the colors for
whichever mode is active.

All three modes respect your site's horizon: if a tree or building
blocks part of your sky, time spent hidden behind it doesn't count as
visible — the shading matches what you'd actually see from your
observing spot.

### Hours above horizon

Answers *"how long is a target up tonight?"*  Each region of sky is
colored by the number of hours it spends above your local horizon
during darkness — deeper colors for shorter visits, brighter colors
for longer ones.

![Hours-above-horizon legend showing colors for one through seven hours and a gold tile for all night](images/shading-legend-hours.png)

The pale gold tile is special: it marks sky that stays up **all
night**, from dusk to dawn.  Targets there can be imaged whenever
your schedule allows.

### Rises

Answers *"when does this part of the sky come up?"*  Colors are
bucketed by rise time — the warm anchor color marks sky that was
already up at sunset, and each step through the palette is one hour
later in the night.  Useful for planning the second half of a
session: anything in the late buckets is what you'll be waiting on.

### Sets

The mirror of Rises: *"when does this part of the sky go down?"*  The
anchor color marks sky that is still up at sunrise; each palette step
is one hour earlier in the night.  Check your target's color before
setting up — if it sets an hour after dusk, it goes to the front of
the queue.

## Horizon files

A horizon file is a 360° profile of the trees, hills, and rooftops
around your observing site — the *real* skyline, not the ideal flat
horizon.  Horizons are captured with **AstroPup Horizon**, a
companion app: stand at your observing spot and sweep the phone
around the compass for about a minute.  The result syncs through
iCloud and appears in Sky automatically.

Once a site has a horizon:

- **Altitude charts** in the object detail sheet shade the region
  below your skyline, so you can see exactly when a target clears
  the trees and when it drops behind them.
- **Chart shading** counts only time spent above your real horizon.
- **Tonight's visibility** in the Targets list reflects the same
  rule, so sorting by visible hours puts genuinely observable
  targets first.

Sites without a horizon use a flat, unobstructed skyline.  You can
also set a simple **minimum altitude** in Settings → Chart, which
raises the working horizon uniformly without capturing a profile.

## Tips

- The **opacity slider** in Settings → Chart fades the shading so
  stars and targets stay readable underneath.
- Shading always describes the **planning date** shown in the
  weather strip — step to a different night and the bands update.
- An object's exact rise, set, and visible hours are on its detail
  sheet, in the altitude chart.  The shading is the map; the detail
  sheet is the itinerary.
