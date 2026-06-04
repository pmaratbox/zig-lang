const std = @import("std");

const Maybe = union(enum) {
    some: i32,
    none,

    fn bind(self: Maybe, f: *const fn (i32) Maybe) Maybe {
        return switch (self) {
            .some => |v| f(v),
            .none => .none,
        };
    }
};

fn add3(x: i32) Maybe {
    return .{ .some = x + 3 };
}

fn mul2(x: i32) Maybe {
    return .{ .some = x * 2 };
}

pub fn main() void {
    const present = Maybe{ .some = 2 };
    const r1 = present.bind(add3).bind(mul2);
    const absent: Maybe = .none;
    const r2 = absent.bind(add3).bind(mul2);

    switch (r1) {
        .some => |v| std.debug.print("{d} ", .{v}),
        .none => std.debug.print("none ", .{}),
    }
    switch (r2) {
        .some => |v| std.debug.print("{d}\n", .{v}),
        .none => std.debug.print("none\n", .{}),
    }
}
