# 0179 — Union-Find

Union (0,1) and (2,3), then query connectivity of (0,1)=yes and (0,2)=no, printing `yes no`. A `parent` array backs the disjoint set, with `find` flattening the path and `unite` linking roots.

## Run

    zig run main.zig
