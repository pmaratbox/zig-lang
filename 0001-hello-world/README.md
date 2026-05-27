# 0001 — Hello, world!

The minimal Zig program: imports the standard library and calls
`std.debug.print`. Note this writes to **stderr**, not stdout — it's the
shortest way to print without dealing with the I/O writer / error-union
machinery, which a later lesson will introduce.

## Run

    zig run main.zig
