# 0089 — Quicksort

Sort the list `3, 1, 4, 1, 5, 2` using quicksort (partition around a pivot, then recurse on each side) and print the result: `1 1 2 3 4 5`. An in-place Lomuto partition sorts within `[lo, hi]`; `isize` indices allow `i - 1` to go negative, and `@intCast` narrows them for indexing.

## Run

    zig run main.zig
