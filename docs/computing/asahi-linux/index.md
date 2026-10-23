---
tags: [operating-system, apple-silicon]
owner: TBD
last_reviewed: 2026-10-23
---
# Asahi Linux

[Asahi Linux](https://asahilinux.org/) runs Linux on Apple Silicon Macs.
We use the **Fedora Asahi Remix** (aarch64), the distribution the Asahi project
officially supports.

## Why we use it

We were experiencing periodic drops in the USB connection to the Nikon DSLR camera on MacOS. 
Asahi has a more reliable USB connection.

## How it works on our machines

Asahi installs **next to macOS**, not in place of it. Each machine keeps a
macOS partition and boots into Asahi by default. **Never** remove the macOS
partition:

- macOS installs firmware updates for the Mac hardware.
- Some hardware settings can only be changed from macOS. For an example, see
  [screen brightness](quirks.md#screen-wont-reach-full-brightness).

To boot into macOS, shut down. Then press and hold the power button until
**Loading startup options** appears, and choose macOS.
