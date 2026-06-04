# 0365 — Multiset Counts

Add 1,1,2 to a multiset; print the count of 1 (2), remove one 1, then print the count of 1 (1), as `2 1`. An `AutoHashMapUnmanaged(i32, u32)` maps each element to its count, incremented on add and decremented on remove.

## Run

    zig run main.zig
