# 0330 — Lens Get/Set

Use a lens over the nested value {a:{b:1}} to get b (1) and to set b to 2, printing `1 2`. The `BLens` struct pairs a `get` reader with an immutable `set` that returns a fresh copy with `b` replaced.

## Run

    zig run main.zig
