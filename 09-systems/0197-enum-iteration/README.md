# 0197 — Enum Iteration

Iterate over all values of a Color enum (RED, GREEN, BLUE) and print their names `RED GREEN BLUE`. Zig exposes enum members at comptime via `std.meta.fields`, iterated with `inline for`.

## Run

    zig run main.zig
