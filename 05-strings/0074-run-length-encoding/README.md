# 0074 — Run-Length Encoding

Run-length encode the string `aaabbc` (each run of a repeated character becomes the character followed by its count), printing `a3b2c1`. The inner `while` (with `i += 1` as its continue-expression) counts a run; `{c}{d}` prints the byte then its count.

## Run

    zig run main.zig
