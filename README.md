# Getting Started with Gno

The easiest way to try Gno in under five minutes.

## Quick Start

1. Clone this repository:
   ```bash
   git clone https://github.com/gnolang/getting-started.git
   cd getting-started
   ```

2. Install dependencies:
   ```bash
   make install
   ```
   This will check if Go is installed and install the required Gno tools. If Go is not installed, you'll be prompted to install it from [go.dev/doc/install](https://go.dev/doc/install).

3. Start the development server:
   ```bash
   make dev
   ```

4. Open your browser and visit [https://localhost:8888](https://localhost:8888)

## What's Included

This repository contains a simple Gno realm with:
- A `Render` function that displays a welcome message and instructions
- A `Set` function to update the realm's state
- A `Get` function to retrieve the stored message

## Next Steps

Ready to learn more? Check out these resources:
- [Gno Documentation](https://docs.gno.land)
- [Gno by Examples](https://github.com/gnolang/by-examples)
- [Gno Repository Template](https://github.com/gnolang/repo-template)

## Development

- Run tests: `make test`
- Start development server: `make dev`
