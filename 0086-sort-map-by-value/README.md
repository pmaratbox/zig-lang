# 0086 — Sort a Map by Value

Sort the map `{a: 3, b: 1, c: 2}` by value in ascending order and print the entries: `b:1 c:2 a:3`. An array of `Entry` structs is sorted with `std.mem.sort` using a `lessThan` comparing the value field.

## Run

    zig run main.zig
