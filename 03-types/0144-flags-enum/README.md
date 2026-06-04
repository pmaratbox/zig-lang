# 0144 — Flag Enum (Bit Flags)

Combine bit flags READ(1) and WRITE(2) into 3, check that WRITE is set, and print `3 yes`. Zig uses plain integer constants with the `|` and `&` bitwise operators for flag sets.

## Run

    zig run main.zig
