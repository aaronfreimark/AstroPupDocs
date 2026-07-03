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

![Weather strip showing a clear night hour by hour, with a green wind glyph, an uncertainty marker, the current-time line, and sunset and sunrise times](images/sky/weather-strip.png)

The strip across the top is tonight's forecast, one icon per hour
from sunset to sunrise — a moon for clear hours, clouds, rain, or
snow otherwise.  A soft glow marks the hours around sunset and
sunrise, a thin line tracks the current time as it crosses, and a
green wind glyph flags any hour with gear-threatening wind.  On long
winter nights the strip folds into tidy two-hour steps so nothing
crowds.  Most of it is tappable:

- **Tap any hour** for the details behind the icon: cloud cover,
  precipitation, wind, temperature, dew point, and humidity.
- **Tap the chevrons** at either edge to step the planning date a
  day at a time, or **tap the date** to jump to any night.  The
  whole app — chart, shading, target list — follows the planning
  date.
- **Tap the site name** to open Settings and switch sites.

Each hour blends six global weather models — Europe's ECMWF, NOAA's
GFS, and the German, Canadian, and UK models among them — into one
consensus that's steadier than any single model.  When the models
disagree about an hour, the strip marks it with a small **?** and
leans the icon toward clear.  Forecasts are cached, so a brief
network outage shows the last known forecast rather than nothing.

### Three sizes, and the week ahead

![Weather strip expanded into the seven-night outlook: one row per night with a verdict symbol and word, from Tomorrow through the following week](images/sky/night-outlook.png)

The strip resizes like a sheet: **swipe down** on it for more,
**swipe up** for less, or tap the small bar beneath it to cycle.
Sky remembers your preferred size.

- **Slim** is just the chevrons, date, and site — maximum room for
  the chart.
- **Standard** is the hour-by-hour strip above.
- **Expanded** adds the **7-night outlook**: one row per upcoming
  night, each with the same verdict words and symbols as the
  clear-sky alerts — *Clear*, *Partly clear*, *Cloudy*, *Rain*,
  *Windy*.  **Tap a night** to plan it: the chart, shading, and
  target list all jump to that night.

## Sky chart

![The main screen: weather strip above a full-disc sky chart with a horizon silhouette, hours-above-horizon shading, legend, and toolbar](images/sky/sky-chart.png)

The chart is your whole sky at once: the edge of the disc is your
horizon, the center is straight up.  Deep-sky objects appear as
catalog symbols, planets as colored discs, comets with a small
anti-sunward tail, and the Moon with its current phase.  The
catalog runs thousands of objects deep: the full NGC and IC plus
six classic supplements — Sharpless and van den Bergh nebulae, the
Lynds bright and dark clouds, and the Perek–Kohoutek and Abell
catalogs.

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

![Hours-above-horizon legend showing colors for one through seven hours and a gold tile for all night](images/sky/shading-legend-hours.png)

**Hours above horizon** colors each region of sky by how long it's
up during darkness.  The pale gold tile marks sky that stays up
**all night**, dusk to dawn — image those targets whenever your
schedule allows.

![Rises legend showing hour-by-hour rise time buckets](images/sky/shading-legend-rises.png)

**Rises** answers "when does this part of the sky come up?"  The
warm anchor color is sky already up at sunset; each step is one
hour later in the night.  Anything in the late buckets is what
you'll be waiting on after midnight.

![Sets legend showing hour-by-hour set time buckets](images/sky/shading-legend-sets.png)

**Sets** is the mirror: the anchor color is sky still up at
sunrise; each step is one hour earlier.  If your target sets an
hour after dusk, it goes to the front of the queue.

## Toolbar

![Toolbar with shading mode, filter, apparent size, more menu, and targets buttons](images/sky/toolbar.png)

The toolbar holds the chart's controls:

- :sf:clock: **Shading** — switch between the three shading modes above.
- :sf:line.3.horizontal.decrease: **Filters** — a grid of chips, arranged as a tour outward:
  **Universe** (galaxies and galaxy groups), **Milky Way** (bright
  and dark nebulae, planetary nebulae, clusters), and the **Solar
  System** (Moon, planets, comets).  Tap a chip to show or hide
  that type; two more chips limit the chart to favorites or hide
  targets you've already imaged.
- :sf:circle.dotted.circle: **Apparent size** — a slider that hides targets smaller than a
  chosen fraction of your field of view, with a live preview.
- :sf:ellipsis: **More** — Settings, this documentation, credits, release
  notes, and a one-tap feedback email.
- :sf:magnifyingglass: **Targets** — the full target list, below.

## Targets list

![Targets list with search and per-target visibility timeline bars](images/sky/targets-list.png)

Everything visible tonight, as a list.  Each row carries a
**visibility timeline** — a bar showing exactly when that target is
above your horizon during the night — plus its type, brightness,
and size.  Sort by hours visible, size, brightness, or name; search
covers the entire catalog, including targets your filters currently
hide.  Planets and comets get their own sections at the top.  Tap
any row for the detail sheet.

## Object detail

![Object detail for galaxy M101: altitude chart with visibility span, photo preview with field-of-view comparison, and rise, set, and transit facts](images/sky/object-detail.png)

Tap any target — on the chart or in the list — for its planning
card:

- **Altitude chart**: the target's path across tonight's sky, with
  the dark window, your horizon profile, and its best visibility
  span called out.  Rise, set, and transit times sit below.
- **Preview**: deep-sky objects show survey photography sized
  against your field of view — honestly, even at the extremes: a
  nebula wider than your frame shows a correspondingly small frame
  over its heart, not a shrunken picture.  Planets show what
  matters tonight —
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

![Saturn with its rings drawn at the current tilt, ring shadow and Cassini division visible](images/sky/planet-saturn.png "Saturn's rings, drawn at their real tilt for the planning date")

![Jupiter with tonight's positions of Io, Europa, Ganymede, and Callisto, labeled](images/sky/planet-jupiter.png "Jupiter's Galilean moons, lined up as they'll appear tonight")

![Top-down comet orbit map showing the Sun, Earth's orbit, the comet with its tail, distances, and the perihelion date](images/sky/comet-orbit.png "A comet's orbit from above — Sun, Earth's orbit, distances, and days to perihelion")

## Widgets

![Two home-screen widgets: a small Tonight's Verdict reading Clear tonight, 6h clear, beside a medium Tonight's Weather showing the hour-by-hour strip with the current-time line](images/sky/widgets.png)

Put tonight's plan on your home or lock screen.  Add one the usual
way — long-press the home screen, tap **+**, and search for
**AstroPup Sky**:

- **Tonight's Weather** mirrors the in-app strip — the cloud
  forecast across tonight's observing window, current-time line and
  all.
- **Tonight's Verdict** is the one-glance call: clear, mixed, or
  cloudy, with the headline and how long the clear stretch lasts.

Both come in home-screen and lock-screen sizes, each can be pinned
to a specific site (or follow your active one), and tapping either
opens Sky to that night.  They refresh in the background and
whenever you open the app.

## Continue from AstroPup Gallery

Inspecting an object in **AstroPup Gallery** on your Mac and
wondering "is this up tonight?"  Hand it off: the object appears
as a Handoff banner at the bottom of your iPhone's App Switcher
(standard Continuity — same iCloud account, Bluetooth and Wi-Fi
on), and Gallery can also share it as a plain link.  Either way,
Sky opens straight to that object's planning card, plotted against
your current site tonight — even if your filters would normally
hide it.

## Settings

### Sites

![Site editor showing the clear-sky alert toggle, location map, and horizon import options](images/sky/site-detail.png)

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

### Weather

![Weather settings: precipitation, wind, and cloud-cover thresholds, each a slider](images/sky/settings-weather.png)

Three sliders set what *you* count as a no-go.  They color the
weather strip and drive the clear-sky verdict and its alerts:

- **Precipitation** and **Wind** — the rain chance and wind speed
  past which an hour counts as poor.  Windy hours also flag a green
  glyph on the strip and can trigger a "Windy tonight" alert.
- **Clouds** — the band from "clear enough" to "too cloudy," so
  partly-cloudy hours read as borderline rather than all-or-nothing.

Clear-sky alerts are switched on per site (above); here you also
pick the delivery hour.

### Everything else

- **Field of View** — save a preset per telescope or lens; the
  active one draws on the chart, and tapping the blue rectangle
  cycles through them.
- **Times** — show every clock readout in your device's time or the
  selected site's local time — handy when you're planning a night at
  a site in another time zone.
- **Chart** — shading opacity, color scheme, grid style, and a
  minimum-altitude floor for sites without a captured horizon.
- **Night definition** — which twilight bounds the dark window,
  from sunset/sunrise to full astronomical darkness.

## Tips

- **Capture your local horizon — it's the single best upgrade.**
  With a horizon profile, every shading mode, visibility timeline,
  and rise and set time reflects the sky you actually have, trees
  and rooftops included.  The companion app **AstroPup Horizon**
  records one in about a minute of sweeping your phone around the
  skyline, and it syncs to Sky automatically.
- **Plan by clear night, not by tonight.**  Step the planning date
  forward with the weather strip's chevrons until you find a clear
  night — the chart, shading, and target list all follow.
- **Let the filters run your imaging queue.**  Mark favorites and
  flag targets you've imaged, then filter to favorites and hide
  imaged — the chart shows only what's left to shoot.
