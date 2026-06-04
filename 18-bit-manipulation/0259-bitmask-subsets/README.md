# 0259 — Enumerate Submasks

Enumerate all submasks of the mask 5 (101) in descending order `5 4 1 0`. The loop steps sub = (sub-1) & mask until it reaches 0, using wrapping subtraction.

## Run

    zig run main.zig
