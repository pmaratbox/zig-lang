# 0043 — Function Composition

Compose `inc` (add one) and `twice` (multiply by two) into one function and apply it to `3`, so `inc(twice(3))` prints `7`. Zig has no closures over runtime state, so — like C — composition is applied directly: `compose` takes the two functions (`comptime` function values) plus the argument and returns `f(g(x))`.

## Run

    zig run main.zig
