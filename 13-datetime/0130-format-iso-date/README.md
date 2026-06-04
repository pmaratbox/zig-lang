# 0130 — Format ISO Date

Format the date y=2026, m=6, d=4 as a zero-padded ISO string `2026-06-04`. Zig's `{d:0>2}` format specifier zero-pads each field to a fixed width.

## Run

    zig run main.zig
