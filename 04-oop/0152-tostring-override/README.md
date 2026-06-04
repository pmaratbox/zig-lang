# 0152 — toString Override

Override the string conversion of a Point(1,2) so it prints `Point(1, 2)`. Zig 0.16 lets a struct define a `format(self, writer)` method that the `{f}` placeholder dispatches to.

## Run

    zig run main.zig
