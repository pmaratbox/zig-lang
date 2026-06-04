# 0169 — Max By Key

From ["a","bbb","cc"] pick the longest string, printing `bbb`. An argmax loop comparing `s.len` tracks the running best slice without allocating.

## Run

    zig run main.zig
