const std = @import("std");

const Node = union(enum) {
    scalar: i32,
    list: []const Node,
};

var first: bool = true;

fn flatten(node: Node) void {
    switch (node) {
        .scalar => |v| {
            if (!first) std.debug.print(" ", .{});
            std.debug.print("{d}", .{v});
            first = false;
        },
        .list => |items| {
            for (items) |child| flatten(child);
        },
    }
}

pub fn main() void {
    // [1,[2,[3,4]],5]
    const inner = [_]Node{ .{ .scalar = 3 }, .{ .scalar = 4 } };
    const middle = [_]Node{ .{ .scalar = 2 }, .{ .list = &inner } };
    const root = [_]Node{ .{ .scalar = 1 }, .{ .list = &middle }, .{ .scalar = 5 } };
    flatten(.{ .list = &root });
    std.debug.print("\n", .{});
}
