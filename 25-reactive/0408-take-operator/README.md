# 0408 — Take Operator

Implement take(n) over an unbounded source of the natural numbers, emitting the first 3 then completing (and unsubscribing the source). Zig uses a `*anyopaque` context plus function pointers to model the observer interface without dynamic dispatch.

## Run

    zig run main.zig
