const std = @import("std");

const Node = struct {
    value: i32,
    next: ?*Node,
};

pub fn main() void {
    var c = Node{ .value = 3, .next = null };
    var b = Node{ .value = 2, .next = &c };
    var a = Node{ .value = 1, .next = &b };

    var node: ?*Node = &a;
    var first = true;
    while (node) |n| {
        if (!first) std.debug.print(" -> ", .{});
        std.debug.print("{d}", .{n.value});
        first = false;
        node = n.next;
    }
    std.debug.print("\n", .{});
}
