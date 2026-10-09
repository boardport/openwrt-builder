---
name: 'Feature Request'
about: 'Suggest a new board target, driver recipe, packaging feature, or builder enhancement'
title: '[FEATURE] '
labels: 'enhancement'
assignees: ''
---

## Motivation & Problem Statement

Describe the hardware platform, driver requirement, or builder feature you would like to see supported.

## Proposed Solution

Describe the proposed implementation, target profile, or architectural improvement.

## Category

Select all that apply:

- [ ] New Board & Target Support (New SoC, board profile, DTS, partition layout)
- [ ] Kernel & Drivers (Mainline kernel support, staging drivers, modem/LTE stack)
- [ ] Bootloader & Packaging (Custom bootloader flow, fastboot/ABL compatibility)
- [ ] Rootfs & Software Bundles (Specialized services, LuCI packages, cellular connection tools)
- [ ] Build Orchestration (Parallelization, caching, containerized builder workflow)
- [ ] Documentation & Guides

## Proposed Usage Syntax

```bash
# Example of how the new feature or profile should be invoked
make build BOARD=<board-name>
```

## Additional Context

Add hardware specifications, serial/EDL logs, reference schematics, or links to upstream documentation.
