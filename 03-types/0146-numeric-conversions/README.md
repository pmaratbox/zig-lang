# 0146 — Numeric Conversions

Truncate 3.9 to the int 3 and widen the int 3 to the float 3.0, printing `3 3.0`. Zig requires explicit builtins `@intFromFloat` (truncates toward zero) and `@floatFromInt` for cross-type numeric casts.

## Run

    zig run main.zig
