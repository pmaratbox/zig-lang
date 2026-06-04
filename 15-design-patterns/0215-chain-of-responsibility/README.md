# 0215 — Chain of Responsibility

Pass a request of level 2 along a handler chain so the level-2 handler handles it, printing `handled by 2`. Each handler links to the next via an optional pointer and forwards when it cannot handle.

## Run

    zig run main.zig
