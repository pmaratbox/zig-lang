# 0025 — Tuples & Multiple Return

Return both the smaller and larger of `3` and `7` from one function, unpacking the pair to print `min: 3` and `max: 7`. `struct { i32, i32 }` is an anonymous tuple returned by value; `.{ a, b }` constructs it and `const lo, const hi = ...` destructures it positionally. A named `struct { lo: i32, hi: i32 }` would instead expose its fields as `.lo`/`.hi`.

## Run

    zig run main.zig
