# 0002 — Variables & basic types

Declare `const` bindings for a 32-bit int (`i32`), a 64-bit float (`f64`),
a string slice (`[]const u8`), and a `bool`. Zig's format specifiers differ
from C's `printf`: `{d}` is decimal, `{s}` formats a string slice as text,
and bare `{}` uses the type's default format.

## Run

    zig run main.zig
