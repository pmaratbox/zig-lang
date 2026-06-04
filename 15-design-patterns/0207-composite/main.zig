const std = @import("std");

const Node = union(enum) {
    leaf: i32,
    composite: []const Node,

    fn size(self: Node) i32 {
        return switch (self) {
            .leaf => |v| v,
            .composite => |children| blk: {
                var total: i32 = 0;
                for (children) |child| total += child.size();
                break :blk total;
            },
        };
    }
};

pub fn main() void {
    const children = [_]Node{ .{ .leaf = 1 }, .{ .leaf = 2 }, .{ .leaf = 3 } };
    const tree = Node{ .composite = &children };
    std.debug.print("{d}\n", .{tree.size()});
}
