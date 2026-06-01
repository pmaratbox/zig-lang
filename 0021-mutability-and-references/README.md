# 0021 — Mutability & References

Have a function increment a value in place — through a pointer, reference, or mutable holder — so the caller sees it change from `before: 1` to `after: 2`. `*i32` is a single-item pointer; `p.* += 1` writes through it, and the caller passes `&n`. The local must be `var` (not `const`) to take a mutable pointer. Zig has no hidden references — indirection is always explicit via pointers.

## Run

    zig run main.zig
