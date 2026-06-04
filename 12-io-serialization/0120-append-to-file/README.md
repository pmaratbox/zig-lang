# 0120 — Append to a File

Write "a" to a file, append "b", then read both lines back and print `a b`. Appending in Zig 0.16 means opening read-write and using `writePositionalAll` at the current `length`, leaving earlier bytes untouched.

## Run

    zig run main.zig
