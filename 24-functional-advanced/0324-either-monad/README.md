# 0324 — Either Monad

Chain Either computations: a successful divide chain yields 2, and a divide-by-zero yields an error, printing `2 err`. A tagged union with `.right`/`.left` lets `bind` short-circuit to the left error on failure.

## Run

    zig run main.zig
