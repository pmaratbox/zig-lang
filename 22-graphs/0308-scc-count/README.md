# 0308 — Strongly Connected Components

Count the strongly connected components of 0->1,1->2,2->0,2->3, printing `2`. A Zig Tarjan pass tracks DFS index and low-link values over file-scope arrays.

## Run

    zig run main.zig 2>&1
