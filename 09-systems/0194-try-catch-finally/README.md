# 0194 — Try / Catch / Finally

Throw and catch an error, printing `caught`, and always run a finally block printing `cleanup`, on two lines. Zig has no exceptions: `catch` handles an error value and a `defer` block plays the role of `finally`.

## Run

    zig run main.zig
