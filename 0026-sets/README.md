# 0026 — Sets

Build a set from `1, 2, 2, 3` so the duplicate collapses, then print its `size: 3` and whether it contains `2` (`has 2: yes`) and `5` (`has 5: no`). Zig has no set type; a `std.AutoHashMap(i32, void)` serves as one, with `void` values so only the keys matter. It needs an allocator (`deinit` frees it); `put` is idempotent on equal keys, `count` sizes it, and `contains` tests membership.

## Run

    zig run main.zig
