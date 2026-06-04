# 0315 — Tree Diameter

Compute the diameter (longest path in edges) of a tree where root has children A and B, and A has children C and D, printing `3`. In Zig a file-scope `var best` accumulates the max left+right depth during a single recursive pass.

## Run

    zig run main.zig 2>&1
