# 0217 — Memento

Save state 1, change it to 2, then restore from the memento, printing current then restored `2 1`. The originator captures its state into a small memento struct and later restores from it.

## Run

    zig run main.zig
