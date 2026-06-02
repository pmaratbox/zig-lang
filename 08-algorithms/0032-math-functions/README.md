# 0032 — Math Functions

Take the square root of `16`, raise `2` to the 10th power, the absolute value of `-5`, and the larger of `3` and `9`, printing `sqrt: 4`, `pow: 1024`, `abs: 5`, and `max: 9`. `std.math.sqrt` and `std.math.pow` work on floats (converted back with `@intFromFloat`), while `@abs` and `@max` are builtin functions (the `@`-prefixed compiler builtins) operating directly on the integer arguments — their results are compile-time-known here only because the operands are literals. No import is needed for the builtins.

## Run

    zig run main.zig
