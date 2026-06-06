# 0401 — Create an Observable

Build a push-based Observable from scratch that emits 1, 2, 3 to its observer and then completes. In Zig the observer is a struct of function pointers (`*const fn`) passed by value into the producer.

## Run

    zig run main.zig
