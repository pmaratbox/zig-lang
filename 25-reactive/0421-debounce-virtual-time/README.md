# 0421 — Debounce (Virtual Time)

Implement debounce(window) on a virtual-time scheduler: emit a value only after a quiet gap of `window` ticks with no newer value. Zig erases observer state behind `*anyopaque` callbacks, recovered with `@ptrCast`/`@alignCast`.

## Run

    zig run main.zig
