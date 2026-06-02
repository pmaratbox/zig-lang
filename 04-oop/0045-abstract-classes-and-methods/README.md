# 0045 — Abstract Classes & Methods

Define an abstract `Shape` with an abstract `area` and a concrete `describe` that uses it, then implement a `Square` of side 3 and print `area: 9`. Zig has no abstract classes; a `struct` with a function-pointer field is a manual vtable. `areaFn` is the "abstract" method supplied per instance, and the regular `describe` method calls it.

## Run

    zig run main.zig
