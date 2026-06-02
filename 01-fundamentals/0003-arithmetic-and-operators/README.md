# 0003 — Arithmetic & operators

Compute and print the five elementary arithmetic operations on two integers
(`a = 17`, `b = 5`). Zig refuses ambiguous integer division — bare `a / b`
on signed integers is a compile error. Use a builtin: `@divTrunc` (toward
zero), `@divFloor` (toward negative infinity), or `@divExact` (when the
result fits exactly). `@rem` is the truncated remainder. Floats use plain
`/` and `%`.

## Run

    zig run main.zig
