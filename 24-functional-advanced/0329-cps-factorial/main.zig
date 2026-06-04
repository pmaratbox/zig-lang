const std = @import("std");

const Cont = struct {
    factor: u64 = 1,
    fn apply(self: Cont, v: u64) u64 {
        return self.factor * v;
    }
};

fn factCps(n: u64, k: Cont) u64 {
    if (n == 0) return k.apply(1);
    return factCps(n - 1, Cont{ .factor = k.factor * n });
}

pub fn main() void {
    // identity continuation: factor = 1
    const result = factCps(5, Cont{});
    std.debug.print("{d}\n", .{result});
}
