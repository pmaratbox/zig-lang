# 0103 — Mutex-Protected Counter

Have multiple threads each increment a shared counter under a mutex so the total is exactly `1000`. Zig 0.16 moved blocking mutexes into `std.Io`, so here a tiny atomic spinlock guards the `+= 1` to keep the increments race-free.

## Run

    zig run main.zig
