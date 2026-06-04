# 0121 — Parse CSV

Parse the two CSV rows `alice,30` and `bob,25` into name=value pairs and print `alice=30 bob=25`. `std.mem.splitScalar` splits rows on newline and fields on comma without allocating any intermediate slices.

## Run

    zig run main.zig
