# 0057 — Sieve of Eratosthenes

Use the Sieve of Eratosthenes to find every prime number up to `10` and print them: `2 3 5 7`. A comptime-sized `[_]bool{true} ** (n + 1)` array holds the flags (`n` is a `const`, so the length is known at compile time); multiples are struck from `i*i`.

## Run

    zig run main.zig
