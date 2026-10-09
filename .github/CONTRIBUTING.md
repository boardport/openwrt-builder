# Contributing to BoardPort — OpenWRT Builder

Thank you for your interest in contributing to **BoardPort — OpenWRT Builder**!
This repository provides an automated, out-of-tree customization layer for generating tailored OpenWRT firmware images for embedded boards,
LTE modems, and edge network devices.

---

## How to Contribute

### 1. Reporting Bugs

- Before opening a new issue, search existing [GitHub Issues](https://github.com/boardport/openwrt-builder/issues) to avoid duplicates.
- Use the **[Bug Report Template](./ISSUE_TEMPLATE/bug_report.md)**.
- Include your target board model, target SoC / architecture, baseline OpenWRT release version, configuration fragments, and full build error logs.

### 2. Adding Board Support & Enhancements

- Propose support for new boards, kernel patches, or cellular/Wi-Fi driver recipes using the
  **[Feature Request Template](./ISSUE_TEMPLATE/feature_request.md)**.
- Adhere to the out-of-tree overlay model: upstream OpenWRT sources must remain decoupled from repository commits.

### 3. Submitting Pull Requests

- Fork the repository and create a feature/fix branch from `main`.
- Keep changes atomic, focused, and well-documented.
- Maintain mirrored bilingual documentation (`*.md` and `*_RU.md`).
- Follow the Conventional Commits specification (e.g., `feat:`, `fix:`, `docs:`, `chore:`).
- Use the **[Pull Request Template](./PULL_REQUEST_TEMPLATE/pull_request_template.md)**.

---

## Development & Architecture Standards

### 1. Overlay Principles

- **No Upstream Source Commits:** Upstream OpenWRT trees, toolchain binaries, and build artifacts (`bin/`, `build_dir/`, `staging_dir/`, `dl/`)
  must never be committed to Git.
- **Declarative Profiles:** Target definitions should be structured as clean manifests, DTS overlays, kernel patch sets, and diffconfigs.
- **Rootfs Separation:** Default user credentials, specific access points, and test keys must not be hardcoded in shared overlays.

### 2. Documentation Standards

- All public documentation must follow `.editorconfig` and `.markdownlint-cli2.jsonc`.
- Run `npx markdownlint-cli2` locally to ensure zero errors before opening a pull request.

---

## Local Verification

Before submitting a Pull Request, run the following verification steps:

```bash
# Verify Markdown documentation linting
npx markdownlint-cli2

# Check Git tracking status
git status
```

---

## Contact & Support

If you have questions or need assistance, contact the maintainers at **BoardPort Team <boardport@proton.me>**
or open an issue on [GitHub Issues](https://github.com/boardport/openwrt-builder/issues).
