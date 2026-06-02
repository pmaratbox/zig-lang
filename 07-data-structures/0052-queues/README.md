# 0052 — Queues

Enqueue `1`, `2`, and `3` into a queue, then dequeue them all and print them in first-in-first-out order: `1 2 3`. Zig has no queue type; an unmanaged `ArrayList` (0.16: `.empty` plus an allocator per call) stands in, with `orderedRemove(0)` taking from the front — O(n), since it shifts the remaining items. A true O(1) FIFO needs your own head/tail ring buffer.

## Run

    zig run main.zig
