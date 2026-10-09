---
name: 'Bug Report'
about: 'Report a build failure, recipe issue, or kernel/target problem in OpenWRT Builder'
title: '[BUG] '
labels: 'bug'
assignees: ''
---

## Description

Provide a clear and concise description of the bug.

## Affected Area

Select all that apply:

- [ ] Target Profile & Device Definition (DTS, partition layout, hardware quirks)
- [ ] Kernel & Drivers (Out-of-tree patches, kmods, modem/Wi-Fi drivers)
- [ ] Bootloader & Packaging (U-Boot, LK, fastboot boot.img, recovery image)
- [ ] Rootfs Overlays & System Configuration (Network profiles, default scripts)
- [ ] Build Orchestration & Automation (Scripts, Makefile, feeds configuration)
- [ ] Documentation / Metadata (`README.md`, `.github/`)

## Hardware & Environment Details

- **Device Model:** [e.g. Board / Dongle / SBC model]
- **SoC / Architecture:** [e.g. ARM64 / ARMv7 / MIPS]
- **OpenWRT Baseline Version:** [e.g. 23.05.3 / snapshot]
- **Host OS & Architecture:** [e.g. Ubuntu 24.04 x86_64]
- **Target Profile Name:** [e.g. generic / board profile name]

## Build Command Executed

Specify the exact command executed:

```bash
# Example build invocation command
make target-build PROFILE=...
```

## Steps to Reproduce

1. Configure target with '...'
2. Run build command '...'
3. See error output '...'

## Expected Behavior

A clear description of what you expected to happen.

## Actual Behavior

A clear description of what occurred, including compilation or packaging error output.

## Terminal Logs & Build Output

```text
Paste raw compilation logs, compiler errors, or stack traces here
```
