# 0082 — Chunk a List

Split the list `1, 2, 3, 4, 5, 6, 7` into chunks of `3` and print each chunk on its own line: `1 2 3`, `4 5 6`, `7`. `@min(i + size, nums.len)` clamps each chunk's end so the final chunk is short; the outer loop steps by `size`.

## Run

    zig run main.zig
