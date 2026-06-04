# 0366 — Sparse Matrix

Store only nonzero entries; with (1,1)=5 set, read (1,1) (5) and (0,0) (0), printing `5 0`. An `AutoHashMapUnmanaged` keyed by a `{row, col}` struct returns 0 via `orelse` for any missing key.

## Run

    zig run main.zig
