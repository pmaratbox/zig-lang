# 0199 — Struct Field Names

List the field names of a Point{x,y} struct/record and print `x y`. Zig introspects struct fields at comptime through `std.meta.fields` / `@typeInfo`.

## Run

    zig run main.zig
