# 0022 — Concurrency

Start two tasks that produce `1` and `2`, let them run concurrently, then join their results and print `sum: 3`. `std.Thread.spawn(.{}, task, args)` starts an OS thread; each thread writes its result through a pointer, and `join()` waits for it. `main` returns `!void` because `spawn` can fail (`try`). Zig's threading is explicit and allocation-free here.

## Run

    zig run main.zig
