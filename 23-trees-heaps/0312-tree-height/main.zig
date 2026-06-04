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

fn height(node: ?*Node) u32 {
    const n = node orelse return 0;
    const l = height(n.left);
    const r = height(n.right);
    return 1 + @max(l, r);
}

pub fn main() void {
    var root: ?*Node = null;
    for ([_]i64{ 5, 3, 8, 1, 4 }) |v| insert(&root, v);

    std.debug.print("{d}\n", .{height(root)});
}
