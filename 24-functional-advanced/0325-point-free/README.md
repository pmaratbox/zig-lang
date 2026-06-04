# 0325 — Point-Free Style

Express "sum of squares" point-free (compose map-square with sum) and apply it to [1,2,3], printing `14`. Zig lacks a `.` composition operator, so `sumOfSquares` is defined as `sum` applied to the mapped slice.

## Run

    zig run main.zig
