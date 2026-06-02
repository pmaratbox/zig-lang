# 0041 — Command-line Arguments

Read the first command-line argument and greet it, so running with `Ada` prints `hello, Ada`. Zig 0.16 hands arguments to `main` via a `std.process.Init.Minimal` parameter; `std.process.Args.Iterator` walks them, with the first `next()` being the program name. (`std.os.argv` was removed.)

## Run

    zig run main.zig -- Ada
