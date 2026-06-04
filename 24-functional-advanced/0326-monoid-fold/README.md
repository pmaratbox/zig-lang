# 0326 — Monoid Fold

Fold lists under two monoids: string concat ["a","b","c"]->"abc" and integer sum [1,2,3]->6, printing `abc 6`. A generic `fold` takes an identity and a `combine` function pointer, reused for both the string and integer monoids.

## Run

    zig run main.zig
