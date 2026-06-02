# 0014 — Higher-Order Functions

Write `apply(f, x)` that calls the function `f` on `x`, then pass it two
different functions, `inc` and `double`. A runtime function value is a pointer,
typed `*const fn (i32) i32`; `&inc` takes the address of a function. (Zig can
also take a function as a `comptime` parameter.)

## Run

    zig run main.zig
