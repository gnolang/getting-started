.PHONY: install dev test

install:
	curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/gnolang/gno/master/misc/install.sh | sh
	@echo '>> binaries are in $$HOME/.gno/bin — add it to your PATH:'
	@echo '   export PATH="$$HOME/.gno/bin:$$PATH"'

dev:
	gnodev .

test:
	gno test .
