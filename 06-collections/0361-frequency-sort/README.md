# 0361 — Frequency Sort

Sort [1,1,2,3,3,3] by descending frequency (ties keep first-seen order), printing `3 3 3 1 1 2`. Counts are tallied into entries carrying a first-seen `order`, then `std.mem.sort` orders by count desc with order as a tiebreaker.

## Run

    zig run main.zig
