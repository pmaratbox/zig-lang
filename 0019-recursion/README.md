# 0019 — Recursion

Define a recursive `factorial(n)` that multiplies `n` by `factorial(n - 1)` until it bottoms out at `1`, then print `factorial(5) = 120`. `std.debug.print` writes to standard error. Zig applies no implicit tail-call optimization here, so depth is bounded by the stack; `u64` is used because `factorial` overflows a 32-bit integer by `13!`.

## Run

    zig run main.zig
