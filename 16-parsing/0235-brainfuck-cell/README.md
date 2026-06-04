# 0235 — Brainfuck Cell

Interpret the Brainfuck program "+++" on a single zeroed cell and print the cell value `3`. A `switch` over each byte applies wrapping `+%=`/`-%=` to one `u8` cell idiomatically.

## Run

    zig run main.zig
