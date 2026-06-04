# 0112 — Predicate Combinators

Combine predicates with AND/OR/NOT: test `isEven AND isPositive` on 4 (yes) and -4 (no), printing `yes no`. Predicates are `*const fn (i32) bool` pointers, and the `both` combinator returns an `And` struct holding two of them.

## Run

    zig run main.zig
