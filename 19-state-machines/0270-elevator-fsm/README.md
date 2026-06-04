# 0270 — Elevator FSM

Move an elevator from floor 0 up to floor 2 then back to 0, printing every floor it stops at `0 1 2 1 0`. A Zig loop steps one floor at a time toward each target, recording the starting floor first.

## Run

    zig run main.zig
