# 0030 — Variadic Functions

Define a function that accepts a variable number of integer arguments and returns their total, then call it with `1, 2, 3` to print `sum: 6`. Zig has no runtime varargs (except for C interop); the idiomatic form takes `args: anytype` — an anonymous tuple like `.{ 1, 2, 3 }` — and an `inline for` unrolls over its fields at compile time. Each element keeps its own type.

## Run

    zig run main.zig
