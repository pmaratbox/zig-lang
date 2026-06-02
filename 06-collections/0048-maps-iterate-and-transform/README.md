# 0048 — Maps: Iterate & Transform

Build a map from letters to numbers (`a`->1, `b`->2, `c`->3), sum all its values, and print `sum: 6`. `std.StringHashMap(i32)` needs an allocator; `valueIterator()` walks the values (each `next()` yields a pointer, dereferenced with `.*`) to sum them. `keyIterator` and `iterator` cover the rest.

## Run

    zig run main.zig
