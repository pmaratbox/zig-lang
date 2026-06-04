# 0300 — Topological Sort

Topologically sort the DAG 0->1,0->2,1->3,2->3 using the Kahn algorithm (smallest index first), printing `0 1 2 3`. A Zig indegree array plus a linear scan for the smallest zero-indegree node keeps the tie-breaking deterministic.

## Run

    zig run main.zig 2>&1
