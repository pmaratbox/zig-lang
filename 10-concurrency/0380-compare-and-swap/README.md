# 0380 — Compare-And-Swap Loop

Increment a shared value to 100 using a CAS retry loop from multiple threads, printing `100`. Zig's `std.atomic.Value(u32).cmpxchgWeak` returns the current value on failure, so the loop retries until the swap lands.

## Run

    zig run main.zig
