# 0276 — Longest Common Substring

Find the longest common contiguous substring of "abcde" and "xbcdy", printing `bcd`. Zig slices the result directly from the input with a comptime-sized DP table.

## Run

    zig run main.zig
