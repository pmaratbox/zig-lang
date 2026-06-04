# 0123 — Base64 Encode

Base64-encode the bytes of "hi" to get `aGk=`. Zig's standard library ships `std.base64.standard.Encoder`, which writes the encoded text into a caller-provided buffer with no allocation.

## Run

    zig run main.zig
