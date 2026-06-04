const std = @import("std");

const Expr = union(enum) {
    num: i64,
    add: struct { lhs: *const Expr, rhs: *const Expr },
};

fn eval(e: *const Expr) i64 {
    return switch (e.*) {
        .num => |n| n,
        .add => |a| eval(a.lhs) + eval(a.rhs),
    };
}

pub fn main() void {
    const one = Expr{ .num = 1 };
    const two = Expr{ .num = 2 };
    const sum = Expr{ .add = .{ .lhs = &one, .rhs = &two } };
    std.debug.print("{d}\n", .{eval(&sum)});
}
