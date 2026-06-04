# 0209 — Observer

Notify two observers of a new value 5; each prints its id and the value on its own line. The subject holds a slice of observers and calls `update` on each in registration order.

## Run

    zig run main.zig
