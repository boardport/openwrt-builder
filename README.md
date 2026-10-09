# 📦 BoardPort — OpenWRT Builder

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](./LICENSE)
[![Project: BoardPort](https://img.shields.io/badge/Project-BoardPort-green.svg)](https://github.com/boardport)
[![Upstream: OpenWRT](https://img.shields.io/badge/Upstream-OpenWRT-00d7d7.svg)](https://openwrt.org)
[![Markdownlint](https://github.com/boardport/openwrt-builder/actions/workflows/markdownlint.yml/badge.svg)](https://github.com/boardport/openwrt-builder/actions/workflows/markdownlint.yml)

Modular out-of-tree OpenWRT firmware builder for embedded boards, cellular 4G/LTE modems, and edge network devices.

This repository is part of the **[BoardPort](https://github.com/boardport)** ecosystem, providing a clean customization layer
over standard OpenWRT build environments without tracking heavy upstream trees or polluting baseline sources.

> 🤖 **Note for AI Assistants:** Autonomous AI agents and LLM assistants must review project guidelines
> in [AGENTS.md](./AGENTS.md) before performing tasks in this repository.

---

## 🎯 About the Project

The primary mission of **OpenWRT Builder** is orchestrating containerized and reproducible builds of OpenWRT firmware
tailored to hardware-specific constraints across diverse embedded platforms:

- 📶 **Cellular 4G/LTE USB Modems and Portable Routers:** Compact mobile gateways, USB sticks, and Wi-Fi dongles.
- 🧩 **Development Single-Board Computers (SBCs):** Evaluation boards, developer kits, and industrial computing modules.
- 📱 **Repurposed Embedded & Mobile Platforms:** Converted hardware platforms transitioning into dedicated IoT gateways or edge routers.

### Repository Architecture

The project is structured as a modular orchestrator coordinating decoupled submodules:

- **`docker/` ([openwrt-docker](https://github.com/boardport/openwrt-docker)):** Multi-stage container build recipes providing isolated compilation
  toolboxes and precompiled cross-toolchains (`aarch64_cortex-a53`, `x86_64`, etc.).
- **`overlay/` ([openwrt-overlay](https://github.com/boardport/openwrt-overlay)):** Out-of-tree hardware overlay containing device trees,
  target definitions, and proprietary board customizations.

---

## ⚡ Quick Start Workflow

The repository includes a ready-to-use Make automation toolkit:

### 1. Inspect Available Commands

```bash
make help
make list
```

### 2. Build the Base Toolbox Container

Build the foundational Debian build environment containing all host compilation tools:

```bash
make openwrt-build-toolbox
```

### 3. Build the Precompiled Cross-Toolchain

Build a container image with a precompiled cross-compiler and host utilities for your target architecture:

```bash
# Default architecture: aarch64_generic (or specify OPENWRT_ARCH=aarch64_cortex-a53)
make openwrt-build-toolchain OPENWRT_ARCH=aarch64_cortex-a53
```

### 4. Interactive Development & Configuration

Spawn an interactive container shell or launch OpenWrt `menuconfig`:

```bash
# Open interactive shell in toolchain environment
make openwrt-sh-toolchain OPENWRT_ARCH=aarch64_cortex-a53

# Launch OpenWrt configuration menu
make openwrt-menuconfig OPENWRT_ARCH=aarch64_cortex-a53
```

---

## 📚 Project Documentation Hub

- 🐳 **[Docker Submodule Documentation](./docker/README.md)** — container architecture, toolchains, and build stages.
- 🧩 **[Overlay Submodule Documentation](./overlay/README.md)** — hardware overlay hierarchy, targets, and driver catalog.
- 🤖 **[AI Guidelines & Agents Context](./AGENTS.md)** — operational protocols and conventions for autonomous AI agents.
- 🤝 **[Contributing Guide](./.github/CONTRIBUTING.md)** — contribution standards, commit rules, and PR requirements.
- 🔒 **[Security Policy](./.github/SECURITY.md)** — vulnerability disclosure procedures.
- 💬 **[Support Resources](./.github/SUPPORT.md)** — community channels and assistance.

---

## 📄 License & Acknowledgments

- Build orchestration recipes, documentation, and tooling are released under the
  **[MIT License](./LICENSE)**.
- OpenWRT is an open-source project licensed primarily under **GPL-2.0**. Sincere appreciation to the OpenWRT community
  for maintaining the leading open wireless router operating system.
