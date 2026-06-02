# 0008 — Strings

Given `name = "world"`, print a greeting, the name in uppercase, and its
length. A string literal is a pointer to a null-terminated byte array, printed
with the `{s}` format specifier. There is no in-place uppercase — write the
result into a buffer with `std.ascii.upperString`. `name.len` is the byte
length, known at compile time.

## Run

    zig run main.zig
