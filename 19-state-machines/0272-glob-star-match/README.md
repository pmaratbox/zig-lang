# 0272 — Glob Star Match

Match the glob "a*b" (* = any run) against "aaab" (yes) and "aac" (no), printing `yes no`. A backtracking matcher with a remembered `*` position implements zero-or-more matching in idiomatic Zig.

## Run

    zig run main.zig
