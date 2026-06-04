# 0391 — URL Percent-Encode

Percent-encode the string "a b&c" to `a%20b%26c`. In Zig, keep unreserved chars and emit `%` plus two uppercase hex nibbles for everything else.

## Run

    zig run main.zig
