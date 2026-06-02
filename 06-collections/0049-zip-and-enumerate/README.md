# 0049 — Zip & Enumerate

Pair the letters `a, b, c` with the numbers `1, 2, 3` position by position, formatting each pair as `key=value` and printing `a=1 b=2 c=3`. Zig's multi-object `for` loop walks several sequences (and an optional index range `0..`) in lockstep: `for (letters, nums, 0..) |k, n, i|`. Because `letters` and `nums` are fixed-size arrays, their lengths must match at compile time (a slice mismatch would instead panic at runtime).

## Run

    zig run main.zig
