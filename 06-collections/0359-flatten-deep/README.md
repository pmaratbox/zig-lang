# 0359 — Flatten Deeply

Flatten the arbitrarily nested structure [1,[2,[3,4]],5] into `1 2 3 4 5`. A tagged `union(enum)` models either a scalar or a nested list, and a recursive function walks it depth-first.

## Run

    zig run main.zig
