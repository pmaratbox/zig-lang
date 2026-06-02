# 0085 — Rotate a List

Rotate the list `1, 2, 3, 4, 5` left by `2` positions (elements wrap to the end) and print it: `3 4 5 1 2`. Indexing `(i + k) % len` for each position prints the left rotation in place (`std.mem.rotate` would do it mutably).

## Run

    zig run main.zig
