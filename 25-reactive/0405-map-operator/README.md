# 0405 — Map Operator

Implement a map operator that transforms each emitted value, applying x => x*2 to a stream of 1, 2, 3, 4. Idiomatic Zig models the Observable/Observer as structs holding a `*anyopaque` context and a function pointer, threading subscriptions synchronously.

## Run

    zig run main.zig
