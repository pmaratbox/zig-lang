# 0176 — Graph DFS

Depth-first traverse from node 0 of the graph 0:[1,2] 1:[0,3] 2:[0,3] 3:[1,2], printing visit order `0 1 3 2`. A recursive `dfs` walks each node's neighbor slice in order, guarded by a shared `visited` array.

## Run

    zig run main.zig
