# 0054 — Resource Cleanup & Defer

Acquire a resource, use it, and let the language release it automatically at scope exit, printing `open`, `use`, and `close` in that order. `defer` runs its statement at the end of the enclosing block; paired with `errdefer` (error paths only) it is Zig's cleanup mechanism. Multiple defers run in reverse order.

## Run

    zig run main.zig
