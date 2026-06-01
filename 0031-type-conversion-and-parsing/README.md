# 0031 — Type Conversion & Parsing

Parse the string `"42"` into an integer and `"3.5"` into a float, then convert the integer back to a string, printing `int: 42`, `float: 3.5`, and `str: 42`. `std.fmt.parseInt(i32, "42", 10)` and `std.fmt.parseFloat(f64, "3.5")` return error unions (handled with `try`), and `std.fmt.bufPrint` formats a number back into a stack buffer — no allocation needed.

## Run

    zig run main.zig
