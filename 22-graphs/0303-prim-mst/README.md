# 0303 — Prim MST

Compute the MST total weight of the chain (0,1,1),(1,2,2),(2,3,3) with Prim, printing `6`. A Zig key array tracks each node's cheapest crossing edge as the tree grows.

## Run

    zig run main.zig 2>&1
