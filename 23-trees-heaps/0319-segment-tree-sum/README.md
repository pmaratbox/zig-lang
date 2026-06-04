# 0319 — Segment Tree Range Sum

Build a segment tree over [1,2,3,4,5] and query the sum of indices 1..3 (inclusive), printing `9`. In Zig a flat `[4*N]i64` array holds the tree, recursing with 2*node child indexing.

## Run

    zig run main.zig 2>&1
