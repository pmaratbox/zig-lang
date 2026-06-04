# 0118 — Option Map Chaining

Map a function over a present optional (10 -> 12) and an absent one (-> fallback), printing `12 none`. Zig's `?i32` optionals are unwrapped with `if (opt) |v|` payload capture, returning `null` to propagate absence.

## Run

    zig run main.zig
