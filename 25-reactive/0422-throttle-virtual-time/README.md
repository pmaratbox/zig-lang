# 0422 — Throttle (Virtual Time)

Implement throttle(window) (leading edge) on a virtual-time scheduler: emit a value, then suppress further values for `window` ticks. In Zig a fixed array sorted by (time, seq) plus `std.sort.block` drives the deterministic scheduler.

## Run

    zig run main.zig 2>&1
