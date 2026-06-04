# 0104 — Atomic Counter

Increment a shared atomic counter from multiple threads 1000 times total without a lock, printing `1000`. Zig's `std.atomic.Value(u32).fetchAdd` does the lock-free increment.

## Run

    zig run main.zig
