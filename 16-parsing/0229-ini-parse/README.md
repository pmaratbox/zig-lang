# 0229 — Parse INI

Parse the INI text with section [s] and key k=v, printing the flattened entry `s.k=v`. Line tokenization tracks the current `[section]` and splits on "=" idiomatically.

## Run

    zig run main.zig
