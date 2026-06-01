# 0037 — Operator Overloading

Define how `+` (or an `add` method) combines two points, then add `(1, 2)` and `(3, 4)` and print `(4, 6)`. Zig intentionally has no operator overloading — it keeps `+` meaning the same everywhere — so a named `add` method on the struct does the combining. Explicitness over hidden behavior is a core Zig value.

## Run

    zig run main.zig
