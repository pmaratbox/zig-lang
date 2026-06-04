# 0107 — Worker Pool

Distribute squaring of 1..4 across a pool of workers, collect the results, and print them sorted ascending `1 4 9 16`. Each worker writes into its own result slot, then `std.mem.sort` makes the output deterministic.

## Run

    zig run main.zig
