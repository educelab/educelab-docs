---
title: Quirks
tags: [operating-system, troubleshooting]
last_reviewed: 2026-10-23
---
# Asahi Linux quirks

Known issues on our Asahi machines and how to work around them. When you add
an entry, use the same fields as the ones below.

## Apple hardware

### Screen won't reach full brightness

- **Symptom:** In Asahi, the screen brightness slider is at the top, but the
  screen is still dim.
- **Cause:** Asahi can't go brighter than the brightness last set in macOS.
- **Workaround:** Boot into macOS (hold the power button at startup, then
  choose macOS). Set the brightness to 100%, then restart into Asahi.
- **Affects:** M1 iMac and M3 MacBook Pro

### USB devices don't reconnect after sleep or restart

- **Symptom:** After the machine sleeps or restarts, USB devices it was using
  stop responding. On the MISHA rig, the LED board and camera stay disconnected
  in the capture app.
- **Cause:** Unknown.
- **Workaround:** Unplug the device's USB cable from the computer and plug it
  back in. For other things to check on the MISHA rig, see the
  [pgs-scan README troubleshooting](https://gitlab.com/educelab/pgs-scan/-/blob/spectral-processing-module/README.md#troubleshooting).
- **Affects:** M1 iMac (MISHA rig) and M3 MacBook Pro

### Connected cameras drain instead of charging

- **Symptom:** A camera plugged in over USB doesn't charge. If it's left
  plugged in, its battery slowly runs down.
- **Cause:** Asahi doesn't seem to be able to charge USB devices like the camera.
- **Workaround:** If the rig will sit idle for a while, unplug the camera's
  USB cable.
- **Affects:** M1 iMac (MISHA rig) and M3 MacBook Pro

## Fedora and the Linux desktop

These issues come from Fedora or the Linux desktop, not Apple hardware.
They'll show up on any Fedora machine.

### Python can't import tkinter

- **Symptom:** A Python GUI app fails with `ModuleNotFoundError: No module named 'tkinter'`.
- **Cause:** Fedora packages tkinter separately from Python.
- **Workaround:** `sudo dnf install python3-tkinter`, then recreate any
  virtual environments that were made without it.

### Serial devices are permission-denied

- **Symptom:** An app can't open `/dev/ttyUSB*` or `/dev/ttyACM*`.
- **Cause:** Serial devices belong to the `dialout` group.
- **Workaround:** From a sudo account, run `sudo usermod -aG dialout USERNAME`.
  Then that user has to log out and back in. To check, run `groups | grep dialout`.

### Camera is "busy" or not found

- **Symptom:** `gphoto2` or the capture app can't claim a USB camera.
- **Cause:** The desktop's automounter (gvfs) grabbed the camera when it was
  plugged in.
- **Workaround:** Close any file manager window showing the camera. To check
  whether the camera is visible, run `gphoto2 --auto-detect`.
