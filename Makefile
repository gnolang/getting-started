.PHONY: install dev test

install:
	@if ! command -v go &> /dev/null; then \
		echo "Go is not installed. Please install Go from https://go.dev/doc/install"; \
		exit 1; \
	fi
	@if [ ! -d "gno" ]; then \
		git clone https://github.com/gnolang/gno.git; \
	fi
	make --no-print-directory -C gno install
	@if ! command -v gnodev &> /dev/null; then \
		echo "Go is not well configured. Please install Go from https://go.dev/doc/install"; \
		exit 1; \
	fi
	@echo "[+] Gno installed successfully."
	
dev:
	gnodev .

test:
	gno test .
