.PHONY: install dev test

install:
	curl -sSL https://raw.githubusercontent.com/gnolang/gno/main/misc/install.sh | bash
	
dev:
	gnodev .

test:
	gno test .
