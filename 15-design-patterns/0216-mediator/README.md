# 0216 — Mediator

Have colleague A send "hi" through a mediator to colleague B, which prints `B got: hi`. Colleagues never reference each other directly; the mediator routes the message to B's `receive`.

## Run

    zig run main.zig
