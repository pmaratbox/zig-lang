# 0016 — Generics

Define a generic `first` function that returns the first element of a list, then call it on a list of integers and a list of strings to show one definition working at two types. Zig has no separate generics system — types are first-class *values* at compile time, so a generic function simply takes a `comptime T: type` parameter. `first(i32, &ints)` and `first([]const u8, &strs)` pass the element type explicitly, and the compiler stamps out a specialized version of each, much like a C++ template. The `{}`/`{s}` format specifiers reflect the differing types.

## Run

    zig run main.zig
