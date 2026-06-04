# 0332 — Y Combinator

Define factorial via a fixed-point combinator (no named self-recursion) and compute 5!, printing `120`. The generator receives its own recursive call as a `self` parameter, and `fix` ties the knot by applying it to itself.

## Run

    zig run main.zig
