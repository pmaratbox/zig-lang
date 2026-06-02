# 0006 — Functions

Define `add(a, b)` returning their sum, call it with `3` and `4`, and print
the result. Signature form is `fn name(params) ReturnType`. Top-level
functions are private to their file by default; `pub` exports them — which
is why `main` is `pub fn main` but the helper `add` need not be.

## Run

    zig run main.zig
