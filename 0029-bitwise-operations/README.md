# 0029 — Bitwise Operations

Compute bitwise AND, OR, and XOR on `6` and `3`, plus a left shift of `6` by one bit, printing `and: 2`, `or: 7`, `xor: 5`, and `shift: 12`. Zig uses `&`, `|`, `^`, and `<<` on sized integer types (here `u8`). Plain `<<` truncates bits shifted past the type's width, while `@shlExact` instead requires that no bits are lost and `<<|` saturates; `6 << 1` is 12, well within `u8`.

## Run

    zig run main.zig
