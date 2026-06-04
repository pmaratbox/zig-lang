# 0309 — Validate BST

Check whether two trees are valid BSTs: a correct one (yes) and one with an out-of-place node (no), printing `yes no`. In Zig the bound check recurses over optional `?*Node` pointers with explicit min/max int sentinels.

## Run

    zig run main.zig 2>&1
