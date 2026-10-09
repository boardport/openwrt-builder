## Description

Provide a clear and concise description of the changes proposed in this Pull Request.

## Affected Components

- [ ] Target Profiles & Board Configurations (DTS, partition definitions)
- [ ] Kernel & Drivers (Patches, kernel defconfig, driver packaging)
- [ ] Bootloader & Image Generation (U-Boot, LK, fastboot boot.img wrapping)
- [ ] Rootfs Overlays & Software Bundles (Network configs, packages)
- [ ] Build Orchestration & Tooling (Scripts, Makefile, feeds automation)
- [ ] AI Agent Context & Guidelines (`AGENTS.md`, `.aiignore`)
- [ ] GitHub Infrastructure & CI (`.github/`)
- [ ] Documentation (`README.md`, guides)

## Type of Change

- [ ] New board or device target support
- [ ] Bug fix / build recipe correction
- [ ] Kernel or driver enhancement
- [ ] Performance / build time optimization
- [ ] Documentation update
- [ ] Refactoring / code cleanup
- [ ] Breaking architectural change

## Quality Checklist

- [ ] Out-of-tree overlay principle is respected (no upstream OpenWRT sources committed).
- [ ] Build directories and caches (`dl/`, `build_dir/`, `staging_dir/`, `bin/`) are not tracked.
- [ ] Target profile compiles cleanly without errors.
- [ ] Markdown linting passes: `npx markdownlint-cli2` returns 0 issues.
- [ ] Mirrored documentation (`*.md` and `*_RU.md`) is synchronized.
- [ ] No secrets, hardcoded credentials, or test keys are present in rootfs overlays.

## Related Issues

Closes #[Issue Number]
