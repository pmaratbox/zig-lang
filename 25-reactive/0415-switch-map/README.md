# 0415 — SwitchMap

Implement switchMap: when a new outer value arrives, cancel the previous inner subscription before starting the new one. Cancellation is a plain `alive = false` flag on the scheduler's task list, kept in a fixed-size token array.

## Run

    zig run main.zig
