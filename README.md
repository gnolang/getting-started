# Getting Started with Gno

This repository is intentionally kept minimal and simple. It's designed to help
you get your first experience with Gno in under five minutes, focusing on the
most common tools and basic concepts.

If you're already familiar with Gno or looking for a more comprehensive setup,
check out the "Next Steps" section below for links to more advanced resources.

## Quick Start

1. Clone this repository:

        git clone https://github.com/gnolang/getting-started.git
        cd getting-started

2. Install dependencies:

        make install

This clones `gnolang/gno` and builds `gno`, `gnokey`, `gnodev`, `gnobro` and
`gnoweb` into `$HOME/.gno/bin`. It needs Go, git and make, and takes a few
minutes the first time. Add the directory to your `PATH` before continuing:

        export PATH="$HOME/.gno/bin:$PATH"

(The installer also has a faster prebuilt-binary mode, but it currently looks
for `v*` release tags and `gnolang/gno` only publishes `chain/*` tags, so
`--from-source` is the path that works today.)

3. Start the development server:

        make dev

4. Open your browser and visit http://localhost:8888

## What's Included

This repository contains a simple Gno realm with:
- A `Render` function that displays a welcome message and instructions
- A `Set` function to update the realm's state
- A `Get` function to retrieve the stored message

## Deploying it

`gnodev` runs a throwaway local chain. When you want your realm on a real
network:

- **[Pearl](https://pearl.testnets.gno.land/)** (`pearl-1`,
  `https://rpc.pearl.testnets.gno.land:443`) is the current testnet — start
  here, and get tokens from the [faucet](https://faucet.gno.land).
- **[Mainnet](https://gno.land)** (`gnoland-1`,
  `https://rpc.gno.land:443`) has been live since 12 September 2026. Real
  GNOT, no faucet.

See [Gno networks](https://docs.gno.land/resources/gnoland-networks) for the
full list.

## Next Steps

Ready to learn more? Check out these resources:

- Gno Documentation: https://docs.gno.land
- Gno Repository Template: https://github.com/gnolang/repo-template
<!--- Gno by Examples: https://github.com/gnolang/by-examples-->
