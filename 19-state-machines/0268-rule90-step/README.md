# 0268 — Cellular Automaton Rule 90

Apply one Rule 90 step (new = left XOR right) to the row "00100" with zero boundaries, printing `01010`. Zig's `^` XOR operator on per-cell `u8` values computes the new row with explicit zero boundaries.

## Run

    zig run main.zig
