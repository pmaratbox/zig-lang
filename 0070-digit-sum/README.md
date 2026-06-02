# 0070 — Digit Sum

Sum the decimal digits of `1234` (repeatedly take the last digit with `% 10` and drop it with `/ 10`) and print the total: `10`. `@rem` peels the last digit and `@divTrunc` drops it; both are explicit builtins in Zig.

## Run

    zig run main.zig
