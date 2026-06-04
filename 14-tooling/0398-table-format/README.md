# 0398 — Aligned Table

Format the rows (a,1),(bb,22) with the first column left-padded to the widest value, printing two aligned rows. Zig's `{s}` prints slices verbatim, so we emit explicit padding spaces after computing the max width.

## Run

    zig run main.zig
