# 0036 — Inheritance & Overriding

Define a base `Animal` with a `speak` method, a `Dog` that overrides it, and call both, printing `animal: some sound` and `dog: Woof`. Zig has no inheritance. A tagged `union(enum)` enumerates the variants, and a method that `switch`es on the active tag returns each one's behavior — the idiomatic closed-set polymorphism. Open polymorphism uses explicit vtables of function pointers.

## Run

    zig run main.zig
