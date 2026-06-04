# 0322 — Lazy Filter + Take

From a lazy stream of naturals, filter the even ones and take three, printing `2 4 6`. The `pull` method advances the underlying counter until it finds the next element passing the even predicate.

## Run

    zig run main.zig
