# 0164 — Merge Maps

Merge {a:1,b:2} and {b:3,c:4} with the right map winning on conflicts, printing `a:1 b:3 c:4`. Applying the right map's `put` calls last to a `std.AutoHashMap` makes it right-biased on key collisions.

## Run

    zig run main.zig
