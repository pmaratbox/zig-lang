# 0344 — Enum Ordinal

For the enum Direction(N,E,S,W) print the ordinal of S (2) and the name at ordinal 3 (W), printing `2 W`. Zig uses `@intFromEnum`/`@enumFromInt` with `@tagName` to bridge values and names.

## Run

    zig run main.zig
