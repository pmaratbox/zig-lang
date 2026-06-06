# 0412 — Combine Latest

Implement combineLatest of two timed streams, emitting the pair of latest values whenever either source emits (once both have emitted). A fixed array of events sorted by `(time, seq)` with `std.mem.sort` gives a deterministic virtual-time scheduler.

## Run

    zig run main.zig
