# 0170 — Index By Key

Index people [(1,alice),(2,bob)] by id into a map, look up id 2, and print `id 2: bob`. A `std.AutoHashMap(u32, []const u8)` keyed by id gives O(1) lookup of the matching name.

## Run

    zig run main.zig
