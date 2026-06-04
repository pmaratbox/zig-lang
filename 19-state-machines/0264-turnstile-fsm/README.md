# 0264 — Turnstile FSM

Drive a turnstile (locked/unlocked) with events coin, push, push and print the resulting states `unlocked locked locked`. Nested Zig `switch` expressions over state and event enums make the transition table exhaustive at compile time.

## Run

    zig run main.zig
