const std = @import("std");

const MathUtil = struct {
    fn square(n: i32) i32 {
        return n * n;
    }
};

pub fn main() void {
    std.debug.print("{d}\n", .{MathUtil.square(6)});
}
