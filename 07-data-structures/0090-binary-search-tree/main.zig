const std = @import("std");

const Node = struct { value: i32, left: ?*Node, right: ?*Node };

fn insert(allocator: std.mem.Allocator, root: ?*Node, value: i32) *Node {
    if (root) |r| {
        if (value < r.value) {
            r.left = insert(allocator, r.left, value);
        } else {
            r.right = insert(allocator, r.right, value);
        }
        return r;
    } else {
        const n = allocator.create(Node) catch unreachable;
        n.* = .{ .value = value, .left = null, .right = null };
        return n;
    }
}

var first = true;

fn inorder(root: ?*Node) void {
    if (root) |r| {
        inorder(r.left);
        if (!first) std.debug.print(" ", .{});
        std.debug.print("{d}", .{r.value});
        first = false;
        inorder(r.right);
    }
}

pub fn main() void {
    const allocator = std.heap.page_allocator;
    var root: ?*Node = null;
    for ([_]i32{ 5, 3, 8, 1, 4 }) |v| {
        root = insert(allocator, root, v);
    }
    inorder(root);
    std.debug.print("\n", .{});
}
