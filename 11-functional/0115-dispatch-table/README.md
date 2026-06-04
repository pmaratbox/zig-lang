# 0115 — Dispatch Table

Store functions in a map keyed by name, then apply "add" and "mul" to (3,4), printing `7 12`. A `std.StringHashMap` mapping names to `*const fn` pointers is the idiomatic Zig dispatch table, looked up and called directly.

## Run

    zig run main.zig
