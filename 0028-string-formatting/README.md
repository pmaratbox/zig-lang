# 0028 — String Formatting

Format the float `3.14159` to two decimals and zero-pad the integer `42` to width five, printing `pi: 3.14` and `id: 00042`. `std.debug.print` takes a format spec inside the braces: `{d:.2}` fixes two decimals and `{d:0>5}` fills with `0`, right-aligned, to width 5. Float formatting is locale-independent.

## Run

    zig run main.zig
