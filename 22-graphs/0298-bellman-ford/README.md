# 0298 — Bellman-Ford

On the digraph with a negative edge 0->1(1),1->2(-2),0->2(4), print the shortest distances from node 0 `0 1 -1`. A Zig edge-list struct array makes the V-1 relaxation passes read directly.

## Run

    zig run main.zig 2>&1
