# 0406 — Filter Operator

Implement a filter operator that forwards only values passing a predicate, keeping the even numbers of 1..6. Zig wires the predicate-gated observer through plain function pointers, so subscribing pushes each source value synchronously.

## Run

    zig run main.zig
