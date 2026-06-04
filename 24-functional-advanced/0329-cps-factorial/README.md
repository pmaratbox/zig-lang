# 0329 — CPS Factorial

Compute 5! in continuation-passing style, printing `120`. Each step threads a `Cont` that accumulates the pending multiplication, and the identity continuation applies the final result.

## Run

    zig run main.zig
