# 0101 — Threads: Spawn and Join

Spawn 3 worker threads, wait for all of them to finish, then print `done: 3`. Zig uses `std.Thread.spawn` and `.join()` with no runtime, so each thread is a real OS thread.

## Run

    zig run main.zig
