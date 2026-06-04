const std = @import("std");

const Node = struct {
    value: i32,
    prev: ?*Node,
    next: ?*Node,
};

pub fn main() void {
    var n1 = Node{ .value = 1, .prev = null, .next = null };
    var n2 = Node{ .value = 2, .prev = null, .next = null };
    var n3 = Node{ .value = 3, .prev = null, .next = null };
    n1.next = &n2;
    n2.prev = &n1;
    n2.next = &n3;
    n3.prev = &n2;

    var fwd: ?*Node = &n1;
    var first = true;
    while (fwd) |n| {
        if (!first) std.debug.print(" ", .{});
        std.debug.print("{d}", .{n.value});
        first = false;
        fwd = n.next;
    }
    std.debug.print("\n", .{});

    var bwd: ?*Node = &n3;
    first = true;
    while (bwd) |n| {
        if (!first) std.debug.print(" ", .{});
        std.debug.print("{d}", .{n.value});
        first = false;
        bwd = n.prev;
    }
    std.debug.print("\n", .{});
}
