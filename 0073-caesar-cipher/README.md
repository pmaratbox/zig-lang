# 0073 — Caesar Cipher

Encrypt `abc` with a Caesar cipher shifting each letter forward by `1` (wrapping within the alphabet) and print the result: `bcd`. Bytes are `u8`; `ch - 'a'` gives `0..25`, `% 26` wraps the shift, and the result is written into a scratch buffer.

## Run

    zig run main.zig
