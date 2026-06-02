# 0035 — Ranges & Slicing

From the list `[10, 20, 30, 40, 50]`, take the sub-sequence at indices 1 through 4 (exclusive) and print `slice: 20 30 40`. A slice expression `nums[1..4]` views elements 1 through 3 of the array without copying. With these compile-time-constant bounds Zig produces a `*const [3]i32` (a pointer to a length-3 array); a runtime bound instead yields a `[]const i32` fat pointer that carries the length. Open-ended `nums[1..]` runs to the end.

## Run

    zig run main.zig
