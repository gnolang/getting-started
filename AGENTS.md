# AGENTS.md

Guide for coding agents (and humans in a hurry) working in this repository.
It is deliberately tiny, like the repo.

## What this is

One Gno realm, `hello.gno`, plus its test. `gnomod.toml` declares the on-chain
path it deploys to. Nothing else. Keep it that way: this repo's whole job is to
be understandable in five minutes.

## Commands

```sh
make          # list every target
make install  # build the gno toolchain into $HOME/.gno/bin (then add it to PATH)
make dev      # local chain + web UI on http://localhost:8888, reloads on save
make test     # gno test .
make lint     # gno lint .
make fmt      # gno fmt -w .
```

`make test lint` is the bar for any change. CI runs those two targets against a
`gno` built from `gnolang/gno` master, while yours is whatever you installed
last, so re-run `make install` before trusting a green local run.

## Gno is not Go

Close enough that Go habits compile in your head and fail on the chain. Read,
do not guess:

- [Realms](https://docs.gno.land/resources/realms): `Render` and realm state
- [Interrealm](https://docs.gno.land/resources/gno-interrealm): crossing
  functions, the `realm` parameter, `cross(...)`
- [Go/Gno compatibility](https://docs.gno.land/resources/go-gno-compatibility):
  what the language keeps, drops and adds
- [Standard libraries](https://docs.gno.land/resources/gno-stdlibs): the subset
  that exists, and `chain/*` in place of Go's runtime packages
- [Testing](https://docs.gno.land/resources/gno-testing): including why an
  `Example*` function needs an `// Output:` block
- [Effective Gno](https://docs.gno.land/resources/effective-gno): idioms worth
  copying

## Tooling worth having

- [`gnoverse/gno-mcp`](https://github.com/gnoverse/gno-mcp): MCP server plus
  agent skills for gno.land. Read and render realms, evaluate expressions,
  deploy to a testnet, audit a realm. Pre-release, and writes are gated to
  dev/testnet.
- [`gnoverse/gnopls`](https://github.com/gnoverse/gnopls): the Gno language
  server, for editors. Setup in
  [Editor Setup](https://docs.gno.land/builders/editor-setup).
