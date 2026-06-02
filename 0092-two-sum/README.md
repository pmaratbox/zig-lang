# 0092 — Two Sum

Find the two indices in `2, 7, 11, 15` whose values sum to `9` and print them: `0 1`. Two nested `while` loops check each pair (O(n^2)); a hash map keyed by value would give the O(n) single-pass approach. A labeled `break :outer` stops as soon as a matching pair is found.

## Run

    zig run main.zig
