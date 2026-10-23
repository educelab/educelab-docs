---
title: Install and reinstall
tags: [operating-system, how-to]
last_reviewed: 2026-10-23
---
# Install and reinstall Asahi Linux

The official guide is the source of truth for the installer itself:
[Asahi Linux documentation](https://asahilinux.org/docs/). This page covers
what's specific to our machines.

## Fresh install

1. Boot into macOS and make sure it's up to date.
2. In macOS, set the screen brightness to 100%. See
   [this quirk](quirks.md#screen-wont-reach-full-brightness).
3. Open Terminal and run the Asahi installer:

    ```bash
    curl https://alx.sh | sh
    ```

4. Follow the prompts. When it asks, pick **Fedora Asahi Remix**. Keep the
   macOS partition (see [why](index.md#how-it-works-on-our-machines)).
5. The installer ends by telling you to shut down and finish setup from the
   startup options screen. Follow those steps exactly.
6. Boot into Asahi and create the user accounts. TBD: list the accounts each
   machine needs and which one has sudo.
7. Set up the machine for its job. See [After installing](#after-installing).
8. Update the [machines table](machines.md).

## Reinstalling

Before you reinstall, back up any data on the machine that isn't stored
somewhere else (for example, captures that haven't been copied off the rig).

- **If only the software is broken**, you probably don't need to reinstall
  the OS. Redo the setup in [After installing](#after-installing) first.
- **For a full reinstall**, remove the existing Asahi partitions from macOS
  first, then do a [fresh install](#fresh-install). Follow the official docs
  for removing partitions.

!!! warning
    Removing the wrong partition can erase macOS. Use the official
    instructions and check each partition before you delete it.

## After installing

### MISHA spectral capture workstation

Follow the setup in the
[pgs-scan README](https://gitlab.com/educelab/pgs-scan/-/blob/spectral-processing-module/README.md).
It covers:

- adding the rig user to the `dialout` group (needs a sudo account)
- installing the Fedora packages it needs (`python3-tkinter`, `perl-Image-ExifTool`)
- cloning the repo and creating the virtual environment
- creating the **Spectral Capture** desktop icon

The README is the source of truth for those steps, so they aren't copied here.
