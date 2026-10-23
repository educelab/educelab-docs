# Contributing

1. Add or edit Markdown files under `docs/`.
2. Pages show up in the sidebar automatically, in alphabetical order. A folder's
   `index.md` becomes that section's landing page. To shorten a page's sidebar
   label, set `title:` in its front matter.
3. Preview your changes before opening a pull request (see below).

## Previewing locally

You need [Python 3](https://www.python.org/downloads/) installed. Then, from
the top folder of the repo, run:

```bash
./preview.sh
```

The first run takes a minute to set things up. The site then opens in your
browser and refreshes each time you save a file. Press `Ctrl+C` in the
terminal to stop it.

## Front matter

Start each page with a front matter block like this one:

```yaml
---
title: Short sidebar label   # optional
tags: [lighting, inventory]  # see the tags in use on other pages
owner: TBD                   # person or role responsible for keeping it current
last_reviewed: 2026-10-23    # update whenever you check that the page is still right
---
```

## Where pages go

Each kind of equipment gets its own top-level section, like `lighting/` or
`imaging-rigs/`.

- **A single instrument** gets one page in its section. Use the
  [equipment page template](#equipment-page).
- **A group of similar units**, like the MISHA LEDs, gets its own folder with
  an `index.md` overview and an `inventory.md` table.
- Once a section has more than about 10 pages, move them into subfolders.

## Page templates

### Equipment page

````markdown
---
title: <Short name>
tags: [<category>]
owner: TBD
last_reviewed: YYYY-MM-DD
---
# <Instrument name>

**Location:** TBD · **Model/Serial:** TBD · **Booking:** TBD

## Overview
What it's for, in one paragraph.

## Getting access
Training needed, and who approves access.

## Basic use
Short steps, or links to how-to pages.

## Maintenance
Schedule, consumables, and service contacts.

## Known issues
Use the same fields as the entries on the quirks pages:
symptom, cause, workaround, affects.

## Manuals & links
````

### Inventory page

Use one Markdown table per inventory, with one row per unit. Include an
**ID** column that matches the label on the unit, and a **Status** column
that uses a fixed set of values. When a unit is retired, set its status to
retired instead of deleting the row. For an example, see the
[MISHA LED inventory](lighting/misha-leds/inventory.md).
