# 0214 — Visitor

Use a visitor to sum the values of a small node tree with leaves 1, 2, 3, printing `6`. Each leaf's `accept` calls back into the visitor's `visit`, which accumulates the total.

## Run

    zig run main.zig
