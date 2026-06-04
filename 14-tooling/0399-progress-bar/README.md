# 0399 — Progress Bar

Render a width-10 progress bar at 40% completion, printing `[####------]`. Zig needs explicit `@floatFromInt`/`@intFromFloat` casts around `@round` to turn the percentage into a fill count.

## Run

    zig run main.zig
