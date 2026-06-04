# 0320 — Fenwick Tree Prefix Sum

Build a Fenwick (BIT) tree over [1,2,3,4,5] and query the prefix sum of the first 4 elements, printing `10`. In Zig the low-bit step uses `i & (~i +% 1)` with wrapping negation on the unsigned index.

## Run

    zig run main.zig 2>&1
