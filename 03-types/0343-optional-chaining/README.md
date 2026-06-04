# 0343 — Optional Chaining

Read a deeply optional value a.b.c when present (5) and when absent (default 0), printing `5 0`. Zig chains `orelse` to unwrap each optional with an early fallback.

## Run

    zig run main.zig
