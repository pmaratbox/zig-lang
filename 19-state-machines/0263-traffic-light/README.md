# 0263 — Traffic Light FSM

Starting at red, advance a traffic light through four transitions (red->green->yellow->red->green), printing each new state `green yellow red green`. A Zig `enum` with a `switch`-based transition function models the FSM idiomatically.

## Run

    zig run main.zig
