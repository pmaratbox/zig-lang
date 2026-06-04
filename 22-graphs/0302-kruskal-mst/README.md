# 0302 — Kruskal MST

Compute the MST total weight of edges (0,1,1),(1,2,2),(0,2,3) with union-find, printing `3`. A Zig union-find parent array plus std.mem.sort selects the two cheapest joining edges.

## Run

    zig run main.zig 2>&1
