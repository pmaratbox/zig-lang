# 0317 — Heap Sort

Heap-sort [5,3,8,1,4] ascending, printing `1 3 4 5 8`. In Zig the sort works in place on a slice with a `siftDown` helper bounded by an explicit end index.

## Run

    zig run main.zig 2>&1
