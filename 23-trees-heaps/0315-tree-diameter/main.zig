const std = @import("std");

const Node = struct {
    left: ?*Node = null,
    right: ?*Node = null,
};

var best: u32 = 0;

fn depth(node: ?*Node) u32 {
    const n = node orelse return 0;
    const l = depth(n.left);
    const r = depth(n.right);
    best = @max(best, l + r);
    return 1 + @max(l, r);
}

pub fn main() void {
    var c = Node{};
    var d = Node{};
    var a = Node{ .left = &c, .right = &d };
    var b = Node{};
    var root = Node{ .left = &a, .right = &b };

    _ = depth(&root);
    std.debug.print("{d}\n", .{best});
}
