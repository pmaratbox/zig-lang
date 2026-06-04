# 0162 — Pad Left and Right

Left-pad and right-pad "5" with spaces to width 3 and print both joined by a pipe: `  5|5  `. The comptime `" " ** pad` builds each space run, with `{s}` format width also available at runtime.

## Run

    zig run main.zig
