# getting-started — run `make` (or `make help`) to see every target.

GNO ?= gno

.DEFAULT_GOAL := help
.PHONY: help install dev test lint fmt deploy

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

# Publishing on-chain needs three things:
#   1. a key with funds — `gnokey add mykey`, then a testnet faucet
#      (https://faucet.gno.land); mainnet has none, it costs real GNOT.
#   2. a namespace you control — set `module` in gnomod.toml to
#      gno.land/r/<your-address>/hello. Your own address always works and
#      needs no registration; a short name has to be registered first.
#   3. the RPC endpoint + chain id of the network you are targeting, from
#      https://docs.gno.land/resources/gnoland-networks
#      (mainnet is https://rpc.gno.land:443, chain id gnoland-1).
PKGPATH ?= $(shell sed -n 's/^module *= *"\(.*\)"/\1/p' gnomod.toml)

deploy: ## publish on-chain: make deploy KEY=<name> REMOTE=<rpc-url> CHAINID=<id>
	@if [ -z "$(KEY)" ] || [ -z "$(REMOTE)" ] || [ -z "$(CHAINID)" ]; then \
	  echo 'usage: make deploy KEY=<keyname> REMOTE=<rpc-url> CHAINID=<chain-id>'; \
	  echo 'pick a network: https://docs.gno.land/resources/gnoland-networks'; \
	  exit 1; \
	fi
	gnokey maketx addpkg -pkgpath "$(PKGPATH)" -pkgdir . \
	  -gas-fee 1000000ugnot -gas-wanted 20000000 \
	  -broadcast -remote "$(REMOTE)" -chainid "$(CHAINID)" "$(KEY)"
