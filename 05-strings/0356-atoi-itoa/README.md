# 0356 — String<->Int Round Trip

Parse "-42" to the integer -42 and format it back to "-42", printing `-42 -42`. Zig hand-rolls atoi and itoa with sign handling and digit math into a fixed buffer.

## Run

    zig run main.zig
