# 0331 — Transducer Pipeline

Compose map(+1) with filter(even) and run it over [1,2,3,4], printing `2 4`. The composed reducing `step` applies the increment then the even filter before collecting, all in a single pass over the input.

## Run

    zig run main.zig
