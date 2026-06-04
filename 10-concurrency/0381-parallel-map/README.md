# 0381 — Parallel Map

Square 1,2,3,4 in parallel and collect the results in input order, printing `1 4 9 16`. Each `std.Thread` writes into its own slot of the results array, so joining preserves input order with no extra reassembly.

## Run

    zig run main.zig
