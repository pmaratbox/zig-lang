# 0047 — Immutable Update (Copy-with)

Make a copy of the point `(1, 2)` with its `x` changed to `9`, leaving the original intact, and print `original: (1, 2)` then `updated: (9, 2)`. Zig structs are value types, so `var p2 = p1;` copies all fields and `p2.x = 9` changes only the copy. The `const` original is immutable; there is no copy-with syntax.

## Run

    zig run main.zig
