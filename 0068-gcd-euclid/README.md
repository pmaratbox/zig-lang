# 0068 — GCD (Euclid)

Compute the greatest common divisor of `48` and `36` with Euclid's algorithm (repeatedly replace the pair with `(b, a % b)` until the remainder is zero) and print it: `12`. `@rem` is the remainder builtin; local `var`s carry the state because parameters are immutable in Zig.

## Run

    zig run main.zig
