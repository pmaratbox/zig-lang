# 0017 — Iterators

Take the numbers 1 through 5, keep the even ones, double each, and add them up — a filter, then a map, then a reduce — printing the final sum. Zig has no lazy iterator adapters in its standard library, so the pipeline is one explicit `for` loop: the filter is the `if`, the map is the `n * 2`, and the reduce is the `sum` accumulator. Modulo uses the builtin `@mod` because `%` on signed integers is a compile error in Zig — `@mod` and `@rem` make the sign behavior explicit.

## Run

    zig run main.zig
