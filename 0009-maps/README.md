# 0009 — Maps

Build a `std.StringHashMap(i32)`, look up `"two"`, and print its value and the
map's size. Hash maps are allocated, so they take an allocator at `init` and
must be freed (`defer map.deinit()`); `put` can fail, which is why `main`
returns `!void`. `.get(key)` returns `?i32` (null if absent), and `.count()`
returns the number of entries.

## Run

    zig run main.zig
