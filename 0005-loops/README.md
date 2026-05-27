# 0005 — Loops

Print 1..5 with a for-loop over a range. Zig's `for` range `1..6` is
**half-open** (like Python). The `|i|` syntax captures the iteration
variable. For counted loops, the portable form is `var i: i32 = 1; while (i <= 5) : (i += 1) { … }` — useful when the type of `i` matters or
when the language version predates the for-range syntax (added in Zig
0.11).

## Run

    zig run main.zig
