const std = @import("std");

const Either = union(enum) {
    right: i32,
    left: []const u8,

    fn bind(self: Either, f: *const fn (i32) Either) Either {
        return switch (self) {
            .right => |v| f(v),
            .left => self,
        };
    }
};

fn divBy(comptime d: i32) *const fn (i32) Either {
    return struct {
        fn call(x: i32) Either {
            if (d == 0) return .{ .left = "err" };
            return .{ .right = @divTrunc(x, d) };
        }
    }.call;
}

pub fn main() void {
    // 8 / 2 / 2 = 2
    const ok = (Either{ .right = 8 }).bind(divBy(2)).bind(divBy(2));
    // 8 / 0 -> err
    const bad = (Either{ .right = 8 }).bind(divBy(0)).bind(divBy(2));

    switch (ok) {
        .right => |v| std.debug.print("{d} ", .{v}),
        .left => |t| std.debug.print("{s} ", .{t}),
    }
    switch (bad) {
        .right => |v| std.debug.print("{d}\n", .{v}),
        .left => |t| std.debug.print("{s}\n", .{t}),
    }
}
