# 0053 — Binary Search

Binary-search the sorted array `1, 3, 5, 7, 9` for `7` and print the index where it is found: `found 7 at index 3`. `hi` is a `usize`, so the else-branch guards `mid == 0` before `mid - 1` to avoid unsigned underflow; the found index is `@intCast` to `isize`. `std.sort.binarySearch` is the library version.

## Run

    zig run main.zig
