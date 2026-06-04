# 0111 — Partial Application

Partially apply a two-argument add by fixing the first argument to 10, then call the result with 3 to print `13`. A small `Bound` struct captures the fixed argument, leaving a one-arg `call` method that forwards to `add`.

## Run

    zig run main.zig
