# 0175 — Graph BFS

Breadth-first traverse from node 0 of the graph 0:[1,2] 1:[0,3] 2:[0,3] 3:[1,2], printing visit order `0 1 2 3`. A fixed-size array acts as the FIFO queue with `head`/`tail` indices, alongside a `visited` bool array.

## Run

    zig run main.zig
