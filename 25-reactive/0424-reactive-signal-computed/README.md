# 0424 — Signal + Computed

Implement fine-grained reactivity: a writable signal and a derived computed that recomputes when its dependency changes. Zig models this with structs holding an unmanaged subscriber list, and `std.debug.print` writes the results to stderr.

## Run

    zig run main.zig 2>&1
