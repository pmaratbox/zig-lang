# 0390 — Big-Endian Bytes

Encode the integer 258 as two big-endian bytes (1, 2), decode them back to 258, printing `1 2 258`. In Zig, shift and mask with `@intCast` to split the u16 into high and low bytes.

## Run

    zig run main.zig
