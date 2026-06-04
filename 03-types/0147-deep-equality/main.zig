const std = @import("std");

const Pair = struct {
    a: i64,
    b: i64,
};

const Nested = struct {
    left: Pair,
    right: Pair,
};

pub fn main() void {
    const x = Nested{ .left = .{ .a = 1, .b = 2 }, .right = .{ .a = 3, .b = 4 } };
    const y = Nested{ .left = .{ .a = 1, .b = 2 }, .right = .{ .a = 3, .b = 4 } };
    const equal = std.meta.eql(x, y);
    std.debug.print("equal: {s}\n", .{if (equal) "yes" else "no"});
}
