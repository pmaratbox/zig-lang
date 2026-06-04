# 0378 — Barrier Synchronization

Have 3 threads each arrive at a barrier before any proceeds, then print `all reached: 3`. Zig builds the barrier from a `std.atomic.Value`, where each thread bumps an arrival count and spin-waits until it reaches the total.

## Run

    zig run main.zig
