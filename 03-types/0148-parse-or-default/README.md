# 0148 — Parse or Default

Parse "42" to 42 and "x" (invalid) to a default 0, printing `42 0`. Zig's `catch` supplies a fallback value when `std.fmt.parseInt` returns an error.

## Run

    zig run main.zig
