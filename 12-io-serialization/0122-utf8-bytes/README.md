# 0122 — UTF-8 Bytes

Print the UTF-8 byte values of "Hi": `72 105`. Zig string literals are already UTF-8 `[]const u8`, so iterating the slice yields the raw bytes directly.

## Run

    zig run main.zig
