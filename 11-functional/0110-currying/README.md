# 0110 — Currying

Curry a two-argument add into a chain of one-argument functions and call it as `add(2)(3)`, printing `5`. Zig has no closures, so `add` returns an `Adder` struct that captures the first argument and exposes a `call` method for the second.

## Run

    zig run main.zig
