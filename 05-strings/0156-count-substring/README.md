# 0156 — Count Substring Occurrences

Count non-overlapping occurrences of "ab" in "ababab", printing `3`. Scanning with `std.mem.eql` and skipping the needle length on each match keeps the matches non-overlapping.

## Run

    zig run main.zig
