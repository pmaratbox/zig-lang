const std = @import("std");

const Node = union(enum) {
    num: i64,
    add: struct { l: *const Node, r: *const Node },
    mul: struct { l: *const Node, r: *const Node },

    fn eval(self: *const Node) i64 {
        return switch (self.*) {
            .num => |n| n,
            .add => |b| b.l.eval() + b.r.eval(),
            .mul => |b| b.l.eval() * b.r.eval(),
        };
    }
};

pub fn main() void {
    const one = Node{ .num = 1 };
    const two = Node{ .num = 2 };
    const three = Node{ .num = 3 };
    const mul = Node{ .mul = .{ .l = &two, .r = &three } };
    const root = Node{ .add = .{ .l = &one, .r = &mul } };
    std.debug.print("{d}\n", .{root.eval()});
}
