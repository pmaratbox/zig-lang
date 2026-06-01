# 0034 — Default & Named Arguments

Give a `greet` function a default greeting, then call it once without the greeting and once overriding it, printing `Hello, Ada` and `Hi, Ada`. Zig has no default parameters, but struct fields can have default values; passing an `Options` struct (with `greeting: []const u8 = "Hello"`) gives both defaults (`.{}`) and named fields (`.{ .greeting = "Hi" }`).

## Run

    zig run main.zig
