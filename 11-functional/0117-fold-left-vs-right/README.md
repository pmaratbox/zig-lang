# 0117 — Fold Left vs Right

Fold subtraction over [1,2,3] from 0 both ways: left ((((0-1)-2)-3)) = -6 and right (1-(2-(3-0))) = 2, printing `-6 2`. `foldl` walks the slice forward accumulating on the left, while `foldr` walks it backward with a `while` loop so the accumulator sits on the right.

## Run

    zig run main.zig
