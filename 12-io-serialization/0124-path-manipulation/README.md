# 0124 — Path Manipulation

Join "/tmp" and "file.txt", then take the basename and extension, printing `/tmp/file.txt file.txt .txt`. `std.fs.path` provides `join`, `basename`, and `extension` so the code never hand-rolls separator handling.

## Run

    zig run main.zig
