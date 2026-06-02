# 0061 — Reverse a String

Reverse the string `abc` character by character and print the result: `cba`. A Zig string is a byte slice; `std.mem.reverse(u8, ...)` reverses the bytes in place — correct for ASCII, but it would break multi-byte UTF-8.

## Run

    zig run main.zig
