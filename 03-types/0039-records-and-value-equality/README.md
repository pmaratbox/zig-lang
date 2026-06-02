# 0039 — Records & Value Equality

Create two points with the same fields, print one as `point: (1, 2)`, and compare them by value to print `equal: yes`. Zig structs have no `==` operator, so equality is explicit: `std.meta.eql` compares two values field by field (recursively). Reference-type or slice fields need custom comparison logic.

## Run

    zig run main.zig
