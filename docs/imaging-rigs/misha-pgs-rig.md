---
title: MISHA PGS rig
tags: [imaging]
owner: TBD
last_reviewed: 2026-10-23
---
# MISHA PGS rig

**Location:** TBD · **Workstation:** M1 iMac running
[Asahi Linux](../computing/asahi-linux/index.md) · **Booking:** TBD

## Overview

A multispectral photogrammetry rig. It captures objects under 16 narrowband
LED panels, using a tethered DSLR and a Bluetooth turntable. The
[pgs-scan](https://gitlab.com/educelab/pgs-scan) software controls the rig
and processes its captures.

| Component | Connects over | Notes |
|---|---|---|
| LED board (16 narrowband panels). See [MISHA LEDs](../lighting/misha-leds/index.md) | USB serial | Needs the `dialout` group on the workstation |
| DSLR (model TBD) | USB (gphoto2) | Set to PTP/normal USB mode |
| Orangemonkie Foldio360 turntable | Bluetooth | |

## Getting access

TBD: training needed, and who approves access.

## Basic use

1. Plug in the camera and the LED board, and power on the turntable.
2. On the workstation, open **Spectral Capture** from the desktop. The app
   connects to all three devices when it starts.

For setup and troubleshooting, see the
[pgs-scan README](https://gitlab.com/educelab/pgs-scan/-/blob/spectral-processing-module/README.md).

## Before leaving it idle

Unplug the camera's USB cable. The workstation doesn't charge the camera, so
leaving it plugged in drains the battery. See the
[Asahi quirk](../computing/asahi-linux/quirks.md#connected-cameras-drain-instead-of-charging).

## Maintenance

TBD: schedule, consumables, and service contacts.

## Known issues

- Workstation quirks: [Asahi Linux quirks](../computing/asahi-linux/quirks.md)

## Manuals & links

- [pgs-scan repository](https://gitlab.com/educelab/pgs-scan)
