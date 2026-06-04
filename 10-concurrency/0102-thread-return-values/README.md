# 0102 — Threads Returning Values

Run two threads that compute the squares of 3 and 4, join them, and print the sum of their results `25`. Zig threads return `void`, so each writes its result through a pointer the main thread reads after `join`.

## Run

    zig run main.zig
