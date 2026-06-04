# 0379 — Future Chain

Chain asynchronous steps 5 -> (*2) -> (+1) and print the final value `11`. Zig has no async runtime, so each step runs on a spawned `std.Thread` whose result is joined before the next step begins.

## Run

    zig run main.zig
