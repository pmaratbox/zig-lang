# 0027 — File I/O

Write `hello, file` to a file, read it back, delete the file, and print `read: hello, file`. Zig 0.16's file I/O goes through an explicit `Io` instance (here a single-threaded one); `Dir.writeFile` and `Dir.readFile` (filling a fixed buffer) transfer the bytes and `deleteFile` removes the path. Passing `Io` makes blocking vs async the caller's choice.

## Run

    zig run main.zig
