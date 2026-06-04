const std = @import("std");

const Node = struct {
    val: i64,
    left: ?*Node = null,
    right: ?*Node = null,
};

var pool: [16]Node = undefined;
var count: usize = 0;

fn insert(root: *?*Node, v: i64) void {
    const node = &pool[count];
    count += 1;
    node.* = .{ .val = v };
    var cur = root;
    while (cur.*) |n| {
        cur = if (v < n.val) &n.left else &n.right;
    }
    cur.* = node;
}

pub fn main() void {
    var root: ?*Node = null;
    for ([_]i64{ 5, 3, 8, 1, 4 }) |v| insert(&root, v);

    var queue: [16]*Node = undefined;
    var head: usize = 0;
    var tail: usize = 0;
    if (root) |r| {
        queue[tail] = r;
        tail += 1;
    }

    var first = true;
    while (head < tail) : (head += 1) {
        const n = queue[head];
        if (!first) std.debug.print(" ", .{});
        first = false;
        std.debug.print("{d}", .{n.val});
        if (n.left) |l| {
            queue[tail] = l;
            tail += 1;
        }
        if (n.right) |r| {
            queue[tail] = r;
            tail += 1;
        }
    }
    std.debug.print("\n", .{});
}
