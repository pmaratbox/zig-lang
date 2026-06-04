# 0113 — Result / Either Type

Model success and failure with a Result type: safeDiv(10,2) prints `ok: 5` and safeDiv(1,0) prints `err: divide by zero`. A tagged `union(enum)` with `ok`/`err` variants is the idiomatic Zig encoding, matched with `switch` payload capture.

## Run

    zig run main.zig
