# 0220 — Null Object

Compare a no-op null logger with a real logger; only the real one records, so print the logged count `1`. The null logger's `log` does nothing while the real one increments the shared count.

## Run

    zig run main.zig
