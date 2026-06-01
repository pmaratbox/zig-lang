# 0040 — Generators & Lazy Sequences

Produce an endless lazy sequence of squares and take only the first three, printing `1 4 9`. Zig has no generators; the idiom is an *iterator struct* with a `next` method holding the state — the same pattern Zig's standard library uses everywhere. The three calls are sequenced into variables for a defined order.

## Run

    zig run main.zig
