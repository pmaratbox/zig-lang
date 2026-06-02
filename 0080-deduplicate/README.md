# 0080 — Deduplicate

Remove duplicates from `1, 2, 2, 3, 1`, keeping the first occurrence of each in order, and print `1 2 3`. A fixed scratch array collects the uniques; each value is linearly checked against those already kept before being added.

## Run

    zig run main.zig
