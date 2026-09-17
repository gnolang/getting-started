# getting-started — run `make` (or `make help`) to see every target.

GNO ?= gno

.DEFAULT_GOAL := help
.PHONY: help install dev test lint fmt

help: ## list the available targets
	@awk 'BEGIN{FS=":.*?## "} /^[a-zA-Z_-]+:.*?## /{printf "  %-8s %s\n",$$1,$$2}' $(MAKEFILE_LIST)

install: ## build the gno toolchain into $HOME/.gno/bin
	# --from-source is required: the installer's prebuilt-binary mode looks for
	# v* release tags, and gnolang/gno only publishes chain/* tags today.
	curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/gnolang/gno/master/misc/install.sh | sh -s -- --from-source
	@echo '>> binaries are in $$HOME/.gno/bin — add it to your PATH:'
	@echo '   export PATH="$$HOME/.gno/bin:$$PATH"'

dev: ## run a local chain + web UI on http://localhost:8888, reloading on save
	gnodev .

test: ## run the tests
	$(GNO) test .

lint: ## catch what only the chain would otherwise catch
	$(GNO) lint .

fmt: ## format every .gno file in place
	$(GNO) fmt -w .
