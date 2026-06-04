# 0165 — All and Any

For [2,4,6] report whether all are even (yes) and whether any are odd (no), printing `yes no`. Zig has no `all`/`any` builtins, so a boolean accumulator folded over a `for` loop expresses both predicates.

## Run

    zig run main.zig
