# 0233 — Expression AST

Build an AST for "1+2*3" and evaluate it to `7`. A tagged `union(enum)` of num/add/mul nodes with a recursive `eval` method models the tree idiomatically.

## Run

    zig run main.zig
