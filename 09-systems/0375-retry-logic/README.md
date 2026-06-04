# 0375 — Retry With Attempts

Retry an operation that fails on attempts 1 and 2 and succeeds on attempt 3, printing `ok after 3`. A Zig `while` loop with `if (call()) |ok| ... else |err| ...` retries until the error union resolves to success.

## Run

    zig run main.zig
