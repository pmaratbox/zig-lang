# 0402 — Observer Contract

Demonstrate the observer contract next*-then-terminal: emit 1 and 2, complete, and show that a post-complete next is ignored. A `stopped` bool on the struct guards each method so terminals and late `next` calls become no-ops.

## Run

    zig run main.zig 2>&1
