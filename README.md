# Getting Started with Gno

One Gno realm, its test, and a Makefile, small enough to read in five minutes.
Everything this file does not explain is in the [Gno documentation](https://docs.gno.land).

## Quick Start

1. Clone this repository:

        git clone https://github.com/gnolang/getting-started.git
        cd getting-started

2. Install the toolchain:

        make install
        export PATH="$HOME/.gno/bin:$PATH"

   This builds `gno`, `gnokey`, `gnodev` and `gnoweb` from source into
   `$HOME/.gno/bin`. Other ways to install them:
   [Installation](https://docs.gno.land/builders/install).

3. Start the development server:

        make dev

4. Open your browser and visit http://localhost:8888

Edit `hello.gno` while `make dev` runs and the page reloads with your change.
Run `make` at any point to see every available target. What else `gnodev` can do:
[Local development with gnodev](https://docs.gno.land/builders/local-dev-with-gnodev).

## What's in here

- `hello.gno`: a realm with `Render` (what gnoweb displays), plus `Set` and `Get`.
- `hello_test.gno`: one test for the state-changing function, one that calls
  `Render`. Every realm wants both.

Why `Set` takes a `realm` parameter and the test calls `cross(...)`:
[Realms](https://docs.gno.land/resources/realms) and
[Interrealm](https://docs.gno.land/resources/gno-interrealm).

## Testing it

        make test    # run the tests
        make lint    # catch what only the chain would otherwise catch
        make fmt     # format every .gno file in place

More: [Testing Gno code](https://docs.gno.land/resources/gno-testing).

## Deploying it

`gnodev` runs a throwaway local chain. To put your realm on a real network,
point `module` in `gnomod.toml` at a path you control (`gno.land/r/<your-address>/hello`
always works and needs no registration), then follow
[Deploy to a shared network](https://docs.gno.land/builders/getting-started#deploy-to-a-shared-network),
which covers the key, the faucet, the namespace and the deploy command itself.

## Next Steps

- [Gno documentation](https://docs.gno.land)
- [Editor setup](https://docs.gno.land/builders/editor-setup), with the
  [`gnopls`](https://github.com/gnoverse/gnopls) language server
- [gnoverse/gno-mcp](https://github.com/gnoverse/gno-mcp): MCP server plus
  skills that put an AI agent on gno.land
- [examples/](https://github.com/gnolang/gno/tree/master/examples): the realms
  and packages that ship with the chain
- [moul/gno-contracts](https://github.com/moul/gno-contracts): what a serious
  Gno repository grows into
- [gnoverse/awesome-gno](https://github.com/gnoverse/awesome-gno): everything else
