# 0419 — Catch Error

Implement catchError that, on an error from the source, switches to a fallback stream. The observer is a struct of function pointers plus an `*anyopaque` context, so the wrapper just swaps in the fallback inside its `error_` callback.

## Run

    zig run main.zig
