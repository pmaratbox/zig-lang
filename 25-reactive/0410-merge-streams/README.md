# 0410 — Merge Streams

Implement merge of two timed streams using a virtual-time scheduler, interleaving them by emission time. Zig sorts scheduled tasks by (time, seq) with std.mem.sort over an unmanaged ArrayList.

## Run

    zig run main.zig
