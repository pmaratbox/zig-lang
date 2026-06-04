# 0373 — Exception Hierarchy

Throw a specific error subtype and catch it through a base-type handler, printing `caught base`. In Zig a specific error value is a member of a broader error set, so catching the set handles the subtype.

## Run

    zig run main.zig
