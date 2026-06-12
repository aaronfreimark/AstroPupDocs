---
id: sky
title: AstroPup Sky Documentation
---

# AstroPup Sky

AstroPup Sky plans tonight's deep-sky imaging session: a full-disc
star chart of your sky, shaded by when targets are visible from
*your* observing site — local horizon, weather, and all.  This page
walks the screen top to bottom, then follows the taps deeper.

On iPad the same tools are arranged for the larger screen: filters
live in a sidebar on the left, and object details open in a panel
beside the chart instead of a sheet.

## Weather strip

![Weather strip showing a clear night hour by hour, with sunset and sunrise times](images/weather-strip.png)

The strip across the top is tonight's forecast, one icon per hour
from sunset to sunrise — a moon for clear hours, clouds, rain, or
snow otherwise.  Most of it is tappable:

- **Tap any hour** for the details behind the icon: cloud cover,
  precipitation, wind, temperature, dew point, and humidity.
- **Tap the chevrons** at either edge to step the planning date a
  day at a time, or **tap the date** to jump to any night.  The
  whole app — chart, shading, target list — follows the planning
  date.
- **Tap the site name** to open Settings and switch sites.

Forecasts come from Open-Meteo and are cached, so a brief network
outage shows the last known forecast rather than nothing.

## Sky chart

![The main screen: weather strip above a full-disc sky chart with a horizon silhouette, hours-above-horizon shading, legend, and toolbar](images/sky-chart.png)

The chart is your whole sky at once: the edge of the disc is your
horizon, the center is straight up.  Deep-sky objects appear as
catalog symbols, planets as colored discs, comets with a small
anti-sunward tail, and the Moon with its current phase.

- **Pinch** to zoom and **drag** to pan.
- **Tap any object** for its detail sheet.
- **Tap empty sky** to dismiss a selection.
- **Tap the blue rectangle** — your telescope's field of view, to
  scale — to cycle between saved FOV presets.

The background tinting is the chart's superpower: it answers a
planning question at a glance.  The default mode shades by **hours
above the horizon** tonight; the legend below the chart explains
whichever mode is active.

## Shading legend

All three modes respect your site's horizon — time a target spends
hidden behind your trees doesn't count as visible.

![Hours-above-horizon legend showing colors for one through seven hours and a gold tile for all night](images/shading-legend-hours.png)

**Hours above horizon** colors each region of sky by how long it's
up during darkness.  The pale gold tile marks sky that stays up
**all night**, dusk to dawn — image those targets whenever your
schedule allows.

![Rises legend showing hour-by-hour rise time buckets](images/shading-legend-rises.png)

**Rises** answers "when does this part of the sky come up?"  The
warm anchor color is sky already up at sunset; each step is one
hour later in the night.  Anything in the late buckets is what
you'll be waiting on after midnight.

![Sets legend showing hour-by-hour set time buckets](images/shading-legend-sets.png)

**Sets** is the mirror: the anchor color is sky still up at
sunrise; each step is one hour earlier.  If your target sets an
hour after dusk, it goes to the front of the queue.

## Toolbar

![Toolbar with shading mode, filter, apparent size, more menu, and targets buttons](images/toolbar.png)

The toolbar holds the chart's controls:

- **Shading** :sf:clock: — switch between the three shading modes above.
- **Filters** :sf:line.3.horizontal.decrease: — show or hide object types (galaxies, nebulae,
  clusters…), planets, and comets; limit to favorites; hide
  targets you've already imaged.
- **Apparent size** :sf:circle.dotted.circle: — a slider that hides targets smaller than a
  chosen fraction of your field of view, with a live preview.
- **More** :sf:ellipsis: — Settings, this documentation, credits, release
  notes, and a one-tap feedback email.
- **Targets** :sf:magnifyingglass: — the full target list, below.

## Targets list

![Targets list with search and per-target visibility timeline bars](images/targets-list.png)

Everything visible tonight, as a list.  Each row carries a
**visibility timeline** — a bar showing exactly when that target is
above your horizon during the night — plus its type, brightness,
and size.  Sort by hours visible, size, brightness, or name; search
covers the entire catalog, including targets your filters currently
hide.  Planets and comets get their own sections at the top.  Tap
any row for the detail sheet.

## Object detail

![Object detail for galaxy M101: altitude chart with visibility span, photo preview with field-of-view comparison, and rise, set, and transit facts](images/object-detail.png)

Tap any target — on the chart or in the list — for its planning
card:

- **Altitude chart**: the target's path across tonight's sky, with
  the dark window, your horizon profile, and its best visibility
  span called out.  Rise, set, and transit times sit below.
- **Preview**: deep-sky objects show survey photography sized
  against your field of view.  Planets show what matters tonight —
  Saturn's ring tilt, Jupiter's moon line-up, Mercury and Venus
  phases.  Comets show a top-down orbit map with distances and the
  perihelion date.  **Tap a planet or comet preview** to open it
  full screen with a date slider and watch it change over time.
- **Favorites and imaged flags**: the star :sf:star.fill: marks a favorite;
  the camera :sf:photo.badge.checkmark.fill: marks targets you've already imaged.  Both sync through
  iCloud to your other devices, and both drive chart filters — so
  your imaging queue follows you.
- **Wikipedia** for the deeper dive.

A few of those previews, worth seeking out:

![Saturn with its rings drawn at the current tilt, ring shadow and Cassini division visible](images/planet-saturn.png)

![Jupiter with tonight's positions of Io, Europa, Ganymede, and Callisto, labeled](images/planet-jupiter.png)

![Top-down comet orbit map showing the Sun, Earth's orbit, the comet with its tail, distances, and the perihelion date](images/comet-orbit.png)

## Settings

### Sites

![Site editor showing the clear-sky alert toggle, location map, and horizon import options](images/site-detail.png)

Your observing sites, synced through iCloud Drive to every device
on your account.  Tap a site to edit its name and location, and to
manage the two features worth setting up:

**A horizon profile.**  Capture one with the companion app
**AstroPup Horizon** — stand at your spot and sweep the phone
around the skyline for about a minute.  It syncs back to Sky
automatically, and from then on every altitude chart, shading mode,
and visibility number reflects your *actual* sky instead of an
ideal flat horizon.  If you set up only one thing, make it this.

**Clear-sky alerts.**  Flip on *Alert for clear skies* and Sky
sends a morning notification when tonight — or an upcoming night —
looks clear at that site.  Notifications and Background App Refresh
must be allowed, and forecasts stay fresh as long as you open the
app every week or so; Sky reminds you if they go stale.

### Everything else

- **Clear sky notifications** — choose the delivery hour and how
  much cloud cover still counts as "clear."
- **Field of View** — save a preset per telescope or lens; the
  active one draws on the chart, and tapping the blue rectangle
  cycles through them.
- **Comets** — comets brighter than the magnitude threshold appear
  automatically; the catalog updates weekly from the Minor Planet
  Center, with a manual refresh button.
- **Chart** — shading opacity, color scheme, grid style, and a
  minimum-altitude floor for sites without a captured horizon.
- **Night definition** — which twilight bounds the dark window,
  from sunset/sunrise to full astronomical darkness.
