const std = @import("std");

const Calc = struct {
    value: i32,
    fn add(self: Calc, n: i32) Calc {
        return .{ .value = self.value + n };
    }
    fn multiply(self: Calc, n: i32) Calc {
        return .{ .value = self.value * n };
    }
};

pub fn main() void {
    const c = (Calc{ .value = 5 }).add(3).multiply(2);
    std.debug.print("{d}\n", .{c.value});
}
