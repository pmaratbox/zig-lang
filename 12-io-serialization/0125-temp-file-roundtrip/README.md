# 0125 — Temp File Roundtrip

Write a string to a temporary file, read it back, confirm it matches, delete the file, and print `roundtrip: ok`. Zig's `Dir.writeFile`/`readFile` plus `std.mem.eql` make the write-read-compare cycle a few explicit, allocation-free steps.

## Run

    zig run main.zig
