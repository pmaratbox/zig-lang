# 0301 — Directed Cycle Detection

Detect a cycle in the digraph 0->1,1->2,2->0, printing `cycle`. A recursive Zig DFS tags nodes white/gray/black so a gray re-visit signals a back edge.

## Run

    zig run main.zig 2>&1
