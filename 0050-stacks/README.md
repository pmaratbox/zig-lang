# 0050 — Stacks

Push `1`, `2`, and `3` onto a stack, then pop them all off and print them in last-in-first-out order: `3 2 1`. `std.ArrayList` (unmanaged in 0.16) backs the stack: `append(allocator, x)` pushes and `pop()` returns the last element as an optional. The allocator is passed to the mutating methods.

## Run

    zig run main.zig
