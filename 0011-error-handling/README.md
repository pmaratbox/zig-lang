# 0011 — Error Handling

Write a `divide(a, b)` that returns an error on a zero divisor, then call it on
`10 / 2` (prints the result) and `10 / 0` (prints an error). Zig has no
exceptions: a function returns an **error union** (`DivError!i32`), and the
caller unwraps it with `if (expr) |value| { ... } else |err| { ... }`.
`@divTrunc` is integer division.

## Run

    zig run main.zig
