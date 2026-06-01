# 0044 — Generic Constraints

Write a generic `largest(a, b)` that requires an ordered type, then call it on integers (3 and 9) and on strings (apple and pear), printing `9` and `pear`. Zig generics are comptime-duck-typed: `largest` takes the type as a `comptime` parameter and a `comptime` `if (T == ...)` branches on it. The requirement is enforced by whether the body compiles for that type, not a declared bound.

## Run

    zig run main.zig
