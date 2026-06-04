# 0206 — Facade

Expose a single facade call that starts three subsystems and reports `ready`. The `Facade.start()` method initializes each subsystem in turn and returns the status string.

## Run

    zig run main.zig
