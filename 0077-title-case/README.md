# 0077 — Title Case

Convert `hello world` to title case (uppercase the first letter of each word) and print it: `Hello World`. Iterating by pointer (`|*ch|`) lets each first-of-word byte be rewritten with `std.ascii.toUpper`, tracked by a `start` flag.

## Run

    zig run main.zig
