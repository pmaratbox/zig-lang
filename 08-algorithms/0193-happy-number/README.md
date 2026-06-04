# 0193 — Happy Number

Determine whether 19 is a happy number and print `yes`. Repeatedly sum squares of digits; 19->1 so yes (detect cycles with a set), here a `std.AutoHashMap` of seen values.

## Run

    zig run main.zig
