# 0396 — Call Counter

Wrap a function so each call increments a counter; after five calls print `calls: 5`. In Zig a small struct holding the count with a mutating method on `*Self` is the idiomatic wrapper.

## Run

    zig run main.zig
