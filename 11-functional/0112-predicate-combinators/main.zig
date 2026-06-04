const std = @import("std");

const Pred = *const fn (i32) bool;

fn isEven(n: i32) bool {
    return @mod(n, 2) == 0;
}

fn isPositive(n: i32) bool {
    return n > 0;
}

const And = struct {
    p: Pred,
    q: Pred,
    fn call(self: And, n: i32) bool {
        return self.p(n) and self.q(n);
    }
};

fn both(p: Pred, q: Pred) And {
    return And{ .p = p, .q = q };
}

pub fn main() void {
    const pred = both(isEven, isPositive);
    std.debug.print("{s} {s}\n", .{
        if (pred.call(4)) "yes" else "no",
        if (pred.call(-4)) "yes" else "no",
    });
}
