# 0108 — Parallel Tasks Combined

Run two independent tasks that produce 10 and 20 concurrently, then combine (sum) their results into `30`. Zig 0.16 has no async/await, so two `std.Thread`s run concurrently and the main thread sums after `join`.

## Run

    zig run main.zig
