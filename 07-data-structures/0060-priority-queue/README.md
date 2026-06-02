# 0060 — Priority Queue

Push `3`, `1`, and `2` into a min-priority-queue, then pop them all and print them in priority (ascending) order: `1 2 3`. `std.PriorityQueue` is unmanaged in 0.16 (`= .empty`, then `push(allocator, x)` / `pop()`); the compare function returning `std.math.order(a, b)` makes it a min-heap.

## Run

    zig run main.zig
