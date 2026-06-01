# 0020 — Pattern Matching

Match `n` against the literal patterns `1` and `2` with a wildcard fallback, mapping `1`, `2`, and `5` to `one`, `two`, and `many`. Zig's `switch` is an expression and must be exhaustive; the `else` prong covers the remaining `i32` values, and each prong yields a value so the result is returned directly. Prongs can also match ranges (`1...9`) and lists of values (`1, 2`).

## Run

    zig run main.zig
