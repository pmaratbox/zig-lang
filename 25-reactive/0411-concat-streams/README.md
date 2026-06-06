# 0411 — Concat Streams

Implement concat: subscribe to the second source only after the first completes; concat [1,2] then [3,4]. Zig uses plain function-pointer structs for observers, with file-scope state to chain the second subscription on completion.

## Run

    zig run main.zig 2>&1
