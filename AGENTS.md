# Project Passport and Operational Guidelines for AI Agents: OpenWRT Builder

> **Project:** BoardPort — OpenWRT Builder  
> **Organization:** [BoardPort](https://github.com/boardport) | **Repository:** `boardport/openwrt-builder`  
> **Mission:** Modular overlay-based OpenWRT firmware builder for legacy and embedded boards  
> **Target Ecosystem:** Embedded hardware platforms, 4G/LTE modems, routers, and SBCs | **License:** [MIT](./LICENSE)  

---

## 1. AI Context Organization

The root [`AGENTS.md`](./AGENTS.md) and [`AGENTS_RU.md`](./AGENTS_RU.md) files serve as the authoritative baseline guidelines for all AI assistants.
Developers directly control, isolate, and customize secondary context for their specific tools:

- **Specialized Directories (`.(gemini|claude|cursor|continue|qwen|etc)/`):** Individual context for specific AI assistants
  (prompts, skills, reports, session dumps). These directories are isolated and excluded from git indexing (`.gitignore`).
- **Context Routing Files:** Navigation and indexing within specialized directories are organized via
  `.{ai}/README(_RU).md` or `.{ai}/AGENTS(_RU).md`. Specialized instructions complement the root guidelines and take precedence within their own context.
- **`.aiignore` File:** Defines resources strictly excluded from background indexing and scanning
  (build trees, package downloads, firmware binaries, temporary caches). Agents may only access these files upon explicit user instruction.

---

## 2. Architecture & Submodule Organization

- **Master Orchestrator Repository:** `boardport/openwrt-builder` coordinates compilation environments and customization layers.
- **Submodule Layers:**
  - `docker/` (`boardport/openwrt-docker`): Container build recipes (`toolbox`, `toolchain`, `target`),
    Dockerfiles, and cross-compilation environment definitions.
  - `overlay/` (`boardport/openwrt-overlay`): Out-of-tree hardware overlay (target profiles, DTS files,
    out-of-tree kernel modules, device quirks).
- **Clean Git Tracking:** Upstream source trees (`/openwrt*`, `/linux*`), local working copies,
  generated firmware images (`output/`, `volumes/output/`), and download caches (`dl/`, `volumes/dl/`) must never be tracked in version control.

---

## 3. Automation Toolkit (Makefile)

The project includes a root orchestrator `Makefile` and modular tasks in `.make/`:

- `make help` / `make list`: Inspect all available automation commands.
- `make openwrt-build-toolbox`: Build base Debian compilation environment image.
- `make openwrt-build-toolchain [OPENWRT_ARCH=...]`: Build precompiled cross-toolchain image for the specified architecture.
- `make openwrt-sh-toolbox` / `make openwrt-sh-toolchain`: Launch interactive containers for development and debugging.
- `make openwrt-menuconfig`: Launch OpenWrt configuration menu inside the containerized environment.

Detailed submodule documentation is available in `docker/README.md` and `overlay/README.md`.

---

## 4. Markdown Documentation Standards

- **Formatting Rules:** Syntax and formatting constraints are governed by `.editorconfig` and `.markdownlint-cli2.jsonc`.
- **Mandatory Lint Command:** Run `npx markdownlint-cli2 "**/*.md"` (must return `0 issues in 0 files` before completing work).
- **Mirrored Bilingualism:** All public user documentation is maintained in parallel (`*.md` in English and `*_RU.md` in Russian).

---

## 5. Git and GitHub Standards (`.github/`)

- Organizational policies, issue templates, PR descriptions, and CI workflows reside in [`.github/`](./.github/).
- Commit message standards follow the Conventional Commits specification (e.g., `feat:`, `fix:`, `docs:`, `chore:`).
- **Git Commits Rule:** Creating Git commits is allowed **only upon direct user confirmation**.
