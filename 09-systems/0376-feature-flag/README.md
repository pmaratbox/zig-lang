# 0376 — Feature Flag

Branch on a boolean feature flag: on -> "enabled", off -> "disabled", printing `enabled disabled`. Zig's `if` is an expression, so the same path yields either label from the `bool`.

## Run

    zig run main.zig
