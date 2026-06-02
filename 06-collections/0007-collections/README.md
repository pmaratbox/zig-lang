# 0007 — Collections

Build an array of the integers `1, 2, 3, 4, 5`, then print its count and its
first and last elements. `[_]i32{ ... }` is a fixed-size array whose length the
compiler infers (here 5), and `.len` is a compile-time-known field. For a
growable collection use `std.ArrayList`, which requires an allocator.

## Run

    zig run main.zig
