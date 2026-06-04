# 0119 — Read File Lines

Write three lines to a file, read them back, and print `lines: 3`. Zig 0.16 routes file work through an explicit `Io` instance, and `std.mem.splitScalar` cheaply iterates the lines without allocating.

## Run

    zig run main.zig
