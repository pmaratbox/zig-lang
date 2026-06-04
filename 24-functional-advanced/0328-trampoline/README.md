# 0328 — Trampoline

Sum 1..100 with a trampolined recursion that avoids deep stacks, printing `5050`. Each step returns a `.more`/`.done` thunk that the trampoline loop drives iteratively, never growing the call stack.

## Run

    zig run main.zig
