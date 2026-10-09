# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Module: OpenWRT Docker Container Workflows
# Description: Build and execution commands for OpenWRT toolbox and cross-toolchains.
# ----------------------------------------------------------------
# Repository: https://github.com/boardport/openwrt-builder
# Author: BoardPort Community <boardport@proton.me>
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# Context variables
PROJECT_MAKE_DIR := $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))
PROJECT_ROOT_DIR ?= $(abspath $(PROJECT_MAKE_DIR)/..)

# Docker variables
DOCKER_DIR          ?= $(PROJECT_ROOT_DIR)/docker
DOCKER_REGISTRY     ?= ghcr.io
DOCKER_IMAGE_PREFIX ?= $(DOCKER_REGISTRY)/boardport

# OpenWRT variables
OPENWRT_ARCH         ?= aarch64_generic
OPENWRT_BRANCH       ?= main

# Helper macro to check if a CLI tool exists in system PATH
define check_tool_installed
	@command -v $(1) > /dev/null 2>&1 || { \
		echo "[ERROR] Make: Utility '$(1)' is not installed. Please install it first."; \
		exit 1; \
	}
endef

# ------------------------------------------------------------------------------
# Pre-execution Checks (Internal)
# ------------------------------------------------------------------------------

docker-check-bin::
	$(call check_tool_installed,docker)

openwrt-check-dirs::
	@mkdir -p "$(DOCKER_DIR)/volumes/dl" "$(DOCKER_DIR)/volumes/output"

openwrt-check:: \
	docker-check-bin \
	openwrt-check-dirs

# ------------------------------------------------------------------------------
# Image Build Commands
# ------------------------------------------------------------------------------

.PHONY: \
	openwrt-build-toolbox \
	openwrt-build-toolchain

openwrt-build-toolbox:: docker-check-bin ## Build minimal Debian toolbox environment image
	@echo "[INFO] Make: Building OpenWRT toolbox base image..."
	@docker image build \
		--file "$(DOCKER_DIR)/images/toolchain/Dockerfile.debian" \
		--target toolbox \
		--tag "$(DOCKER_IMAGE_PREFIX)/openwrt-toolbox:$(OPENWRT_BRANCH)" \
		"$(PROJECT_ROOT_DIR)"

openwrt-build-toolchain:: docker-check-bin ## Build toolchain image for OPENWRT_ARCH (Usage: make openwrt-build-toolchain [OPENWRT_ARCH=...])
	@echo "[INFO] Make: Building OpenWRT cross-toolchain image..."
	@docker image build \
		--file "$(DOCKER_DIR)/images/toolchain/Dockerfile.debian" \
		--build-arg OPENWRT_BRANCH="$(OPENWRT_BRANCH)" \
		--build-arg OPENWRT_CONFIG_TARGET_ARCH_PACKAGES="$(OPENWRT_ARCH)" \
		--tag "$(DOCKER_IMAGE_PREFIX)/openwrt-toolchain:$(OPENWRT_BRANCH)-$(OPENWRT_ARCH)" \
		--tag "$(DOCKER_IMAGE_PREFIX)/openwrt-toolchain:$(OPENWRT_ARCH)" \
		"$(PROJECT_ROOT_DIR)"

# ------------------------------------------------------------------------------
# Container Runtime & Interactive Shells
# ------------------------------------------------------------------------------

.PHONY: \
	openwrt-sh-toolbox \
	openwrt-sh-toolchain \
	openwrt-menuconfig

openwrt-sh-toolbox:: openwrt-check ## Open interactive shell inside toolbox container
	@echo "[INFO] Make: Spawning interactive shell in toolbox container..."
	@docker run --rm -it \
		-v "$(DOCKER_DIR)/volumes/dl:/opt/openwrt/dl" \
		-v "$(DOCKER_DIR)/volumes/output:/opt/openwrt/bin" \
		"$(DOCKER_IMAGE_PREFIX)/openwrt-toolbox:$(OPENWRT_BRANCH)" \
		bash

openwrt-sh-toolchain:: openwrt-check ## Open interactive shell inside toolchain container (Usage: make openwrt-sh-toolchain [OPENWRT_ARCH=...])
	@echo "[INFO] Make: Spawning interactive shell in toolchain container..."
	@docker run --rm -it \
		-v "$(DOCKER_DIR)/volumes/dl:/opt/openwrt/dl" \
		-v "$(DOCKER_DIR)/volumes/output:/opt/openwrt/bin" \
		"$(DOCKER_IMAGE_PREFIX)/openwrt-toolchain:$(OPENWRT_ARCH)" \
		bash

openwrt-menuconfig:: openwrt-check ## Launch OpenWRT menuconfig in toolchain container (Usage: make openwrt-menuconfig [OPENWRT_ARCH=...])
	@echo "[INFO] Make: Launching menuconfig in toolchain container..."
	@docker run --rm -it \
		-v "$(DOCKER_DIR)/volumes/dl:/opt/openwrt/dl" \
		-v "$(DOCKER_DIR)/volumes/output:/opt/openwrt/bin" \
		"$(DOCKER_IMAGE_PREFIX)/openwrt-toolchain:$(OPENWRT_ARCH)" \
		make menuconfig
