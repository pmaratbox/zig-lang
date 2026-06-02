# 0056 — Linked List

Build a singly-linked list holding `1`, `2`, and `3`, then traverse it from head to tail and print `1 -> 2 -> 3`. A `Node` struct holds an `i32` and an optional pointer `?*Node` (null at the tail); here the nodes live on the stack, and `while (node) |n|` unwraps the optional pointer each step.

## Run

    zig run main.zig
