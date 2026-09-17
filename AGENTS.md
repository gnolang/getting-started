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
  supports no width or padding flags (`ufmt.Sprintf("%03d", 7)` returns `"7"`).

## Conventions

- Conventional single-line commits: `feat: …`, `fix: …`, `chore: …`.
- No AI co-author trailers.
- Don't add folders, CI jobs, or dependencies. Simplicity is the feature; if
  something needs more machinery, it belongs in a bigger repo such as
  [moul/gno-contracts](https://github.com/moul/gno-contracts), not here.
