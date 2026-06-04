# 0172 — Ring Buffer

Push 1,2,3,4,5 into a fixed capacity-3 ring buffer (overwriting oldest) and print the final contents `3 4 5`. A fixed `[3]i32` array with `head`/`len` indices wraps via modular arithmetic, advancing `head` once the buffer is full.

## Run

    zig run main.zig
