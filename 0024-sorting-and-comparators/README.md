# 0024 — Sorting & Comparators

Sort `[3, 1, 2]` ascending, then again with a custom comparator that reverses the order, printing `asc: 1 2 3` and `desc: 3 2 1`. `std.mem.sort` sorts a slice in place given a context and a less-than function; `std.sort.asc(i32)` and `std.sort.desc(i32)` are ready-made comparators. It is a stable sort, while `std.sort.pdq` is the faster unstable variant.

## Run

    zig run main.zig
