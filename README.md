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

Edit `hello.gno` while `make dev` runs and the page reloads with your change.
Run `make` at any point to see every available target.

## What's Included

This repository contains a simple Gno realm with:
- A `Render` function that displays a welcome message and instructions
- A `Set` function to update the realm's state
- A `Get` function to retrieve the stored message

## Testing it

        make test    # run the tests
        make lint    # catch what only the chain would otherwise catch
        make fmt     # format every .gno file in place

`hello_test.gno` shows the two tests every realm wants: one that exercises the
state-changing function (note the `cur realm` parameter and the `cross(cur)`
call — that's how Gno marks a "crossing" call into a realm), and one that calls
`Render`, which is the realm's entire public surface.

## Deploying it

`gnodev` runs a throwaway local chain. To put your realm on a real network,
point `module` in `gnomod.toml` at a path you control — `gno.land/r/<your-address>/hello`
always works and needs no registration — then follow
[Deploy to a shared network](https://docs.gno.land/builders/getting-started#deploy-to-a-shared-network),
which covers the key, the faucet, the namespace and the `gnokey maketx addpkg`
command for every network.

## Next Steps

Ready to learn more? Check out these resources:

- Gno Documentation: https://docs.gno.land
- The realms and packages that ship with the chain:
  https://github.com/gnolang/gno/tree/master/examples — the standard library of
  Gno, from `r/gnoland/home` to the `p/demo` packages everything else builds on.
- Real-world packages and realms to read and copy from:
  https://github.com/moul/gno-contracts — 50+ versioned, self-contained
  contracts, each with a README and tests, continuously built against gno
  master. A good look at what a serious Gno repository grows into.
- Everything else Gno: https://github.com/gnoverse/awesome-gno
<!--- Gno by Examples: https://github.com/gnolang/by-examples-->
