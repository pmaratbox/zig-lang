# 0407 — Scan (Running Fold)

Implement a scan operator that emits the running accumulation; produce the running sums of 1, 2, 3, 4. In Zig a type-erased `*anyopaque` context plus a function pointer models the push-based observer without closures.

## Run

    zig run main.zig
