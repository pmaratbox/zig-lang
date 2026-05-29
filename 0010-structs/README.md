# 0010 — Structs

Define a `Person` struct with a `name` and an `age`, create one ("Ada", 36),
and print each field. `struct { ... }` is an anonymous type, bound to a name
with `const Person = struct { ... }`. A struct literal `Person{ .name = ...,
.age = ... }` builds an instance; fields are read with the `.` operator.

## Run

    zig run main.zig
