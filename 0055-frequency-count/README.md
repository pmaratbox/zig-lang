# 0055 — Frequency Count

Count how many times each letter appears in `banana` and print the per-letter counts in alphabetical order: `a:3 b:1 n:2`. A 256-entry array indexed by byte is the tally; iterating it with `0..` yields the bytes in ascending order, so present letters print alphabetically. `{c}` formats a byte as a character.

## Run

    zig run main.zig
