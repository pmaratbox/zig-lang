# 0023 — Modules & Imports

Define `square(n)` in a separate `mathutil` module and import it from the main program, printing `square(8) = 64` across the module boundary. `@import("mathutil.zig")` is a compile-time builtin that returns the file as a struct whose `pub` declarations are its members, accessed as `mathutil.square`. There is no separate import statement or build manifest — the importing file references the sibling by path.

## Run

    zig run main.zig
