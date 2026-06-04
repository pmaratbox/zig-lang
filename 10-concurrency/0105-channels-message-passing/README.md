# 0105 — Channels / Message Passing

Send the values 1, 2, 3 through a channel (or queue) from one thread and receive them in order, printing `1 2 3`. Zig has no built-in channel, so we build a small ring buffer guarded by an atomic spinlock that the receiver polls.

## Run

    zig run main.zig
