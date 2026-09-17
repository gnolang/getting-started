.PHONY: install dev test

install:
	# --from-source is required: the installer's prebuilt-binary mode looks for
	# v* release tags, and gnolang/gno only publishes chain/* tags today.
	curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/gnolang/gno/master/misc/install.sh | sh -s -- --from-source
	@echo '>> binaries are in $$HOME/.gno/bin — add it to your PATH:'
	@echo '   export PATH="$$HOME/.gno/bin:$$PATH"'

dev:
	gnodev .

test:
	gno test .
