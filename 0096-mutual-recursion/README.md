# 0096 — Mutual Recursion

Using two mutually recursive functions `isEven` and `isOdd` (each calling the other), report whether `4` and `3` are even, printing `even` and `odd`. Container-level functions are order-independent in Zig, so `isEven` and `isOdd` reference each other directly.

## Run

    zig run main.zig
