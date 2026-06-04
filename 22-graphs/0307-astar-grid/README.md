# 0307 — A* on a Grid

Find the shortest path length from (0,0) to (2,2) on an obstacle-free 3x3 grid (4-directional) with the Manhattan heuristic, printing `4`. A Zig fixed-size open list scans for the lowest f-score each step without a heap allocator.

## Run

    zig run main.zig 2>&1
