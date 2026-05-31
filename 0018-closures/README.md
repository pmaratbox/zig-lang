# 0018 — Closures

Build a counter that captures a private count starting at zero; each call to the returned function increments the count and returns it, so calling it twice prints 1 then 2. Zig has no closures by design — functions cannot capture environment — so, as in C, the state is explicit: a `Counter` struct holds `count` and a `next` method takes `*Counter` (the `self` pointer) to mutate it. The variable must be declared `var` so it is mutable, and `c.next()` is method-call sugar for `Counter.next(&c)`.

## Run

    zig run main.zig
