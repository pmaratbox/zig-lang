# 0098 — Memoization

Compute `fibonacci(10)` recursively with memoization (caching each result so it is computed once) and print it: `55`. A global array initialized to `-1` is the cache; a non-`-1` slot is a cached result (a HashMap would work for sparse keys).

## Run

    zig run main.zig
