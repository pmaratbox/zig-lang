# 0066 — Multiple Assignment & Destructuring

Swap two variables (`a = 1`, `b = 2`) with a single multiple-assignment, then unpack the pair `(3, 4)` into two variables — printing `2 1` then `3 4`. Zig destructures a tuple with `const x, const y = .{ 3, 4 };`. Its destructuring assignment is sequential, not simultaneous, so the swap snapshots `.{ b, a }` into a tuple first, then unpacks it.

## Run

    zig run main.zig
