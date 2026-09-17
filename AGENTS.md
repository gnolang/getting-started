# AGENTS.md

Guide for coding agents (and humans in a hurry) working in this repository.
It is deliberately tiny — so is the repo.

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

`make test lint` is the bar for any change. CI runs exactly those two targets
against a gno built from `gnolang/gno` master, so a green local run means a
green CI.

## Tooling worth having

- [`gnoverse/gno-mcp`](https://github.com/gnoverse/gno-mcp) — MCP server plus
  agent skills for gno.land: read and render realms, evaluate expressions,
  deploy to a testnet, audit a realm. Its `gno` skill is the knowledge layer
  this file is deliberately too small to be. Pre-release; writes are gated to
  dev/testnet.
- [`gnoverse/gnopls`](https://github.com/gnoverse/gnopls) — the Gno language
  server, for editors. Experimental; setup in
  [Editor Setup](https://docs.gno.land/builders/editor-setup).

## Gno is not quite Go

Close enough that Go habits compile in your head and fail on the chain:

- **State-mutating exported functions are "crossing" functions**: they take a
  first parameter `cur realm`, and callers use `cross(cur)`. See `Set` in
  `hello.gno` and its call in `hello_test.gno`.
- **`Render(path string) string` is the realm's whole public surface.** gnoweb
  calls it for every page view. Always keep a test that calls it.
- **`Example*` tests need an `// Output:` block** or `gno test` skips them
  silently — an example without one asserts nothing.
- **Render must be deterministic.** Map iteration order is unspecified, so never
  build output by ranging a map.
- **The standard library is a subset.** `sort.Slice` does not exist, and `ufmt`
  honours only some of `fmt`'s flags: `ufmt.Sprintf("%03d", 7)` returns `"7"`,
  and `%-5s` comes back as `(unhandled verb: %-)`.
