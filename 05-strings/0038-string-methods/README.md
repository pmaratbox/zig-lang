# 0038 — String Methods

Split `"a,b,c"` on commas, upper-case each part, and join them with `-`, printing `A-B-C`. Zig has no high-level string type — strings are `[]const u8` byte slices. `std.mem.splitScalar` iterates the comma-separated parts, `std.ascii.toUpper` upper-cases each byte, and the result is built into a fixed buffer.

## Run

    zig run main.zig
