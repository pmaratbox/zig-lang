# 0116 — Function Pipeline

Compose inc, double, and negate into a left-to-right pipeline and apply it to 3: ((3+1)*2) negated = `-8`. The `pipe` helper folds a slice of `*const fn` pointers over an accumulator, applying each stage in order.

## Run

    zig run main.zig
