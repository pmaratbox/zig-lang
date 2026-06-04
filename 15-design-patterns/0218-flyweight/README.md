# 0218 — Flyweight

Share flyweight instances for repeated characters a, b, a and print the number of distinct objects created `2`. A factory caches glyphs in a hash map keyed by character and only constructs new ones on a miss.

## Run

    zig run main.zig
