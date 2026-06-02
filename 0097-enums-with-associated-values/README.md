# 0097 — Enums with Associated Values

Define a shape type carrying associated data — `Rect(2, 3)` and `Square(4)` — compute each area by matching on the variant, and print `6` and `16`. `union(enum)` is a tagged union; `switch` matches each tag and the `|capture|` binds that variant's payload.

## Run

    zig run main.zig
