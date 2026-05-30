# 0015 — Interfaces

Define a `Shape` interface with `name()` and `area()` methods, implement it for a rectangle and a square, then loop over a collection of shapes and print each one's area. Zig has no `interface` keyword; for a closed set of types the idiomatic tool is a *tagged union* — `union(enum)` carries one of the variant structs, and methods `switch` on the active tag, capturing the payload with `|r|`. This is dispatch the compiler can see through and check for exhaustiveness. (For open-ended polymorphism Zig uses an explicit vtable of function pointers, as `std.mem.Allocator` does.)

## Run

    zig run main.zig
