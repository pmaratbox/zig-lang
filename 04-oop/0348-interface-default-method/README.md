# 0348 — Interface Default Method

Define an interface with a default greet() returning "hi" and an implementer that overrides it to "hey", printing `hi hey`. Zig has no interfaces, so a `Default` struct supplies the fallback method while an `Override` struct shadows it.

## Run

    zig run main.zig
