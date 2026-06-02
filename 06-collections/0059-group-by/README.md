# 0059 — Group By

Group the words `one`, `two`, `three` by their length and print each length with its words, in ascending order of length: `3:[one,two] 5:[three]`. Zig has no map convenience here; with the words fixed, the code scans each candidate length from `1` upward and gathers matches in order. `{s}` formats a string slice.

## Run

    zig run main.zig
