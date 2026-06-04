const std = @import("std");

const Node = struct {
    val: i64,
    left: ?*Node = null,
    right: ?*Node = null,
};

const Tree = struct {
    root: ?*Node = null,
    pool: [16]Node = undefined,
    count: usize = 0,

    fn insert(self: *Tree, v: i64) void {
        const node = &self.pool[self.count];
        self.count += 1;
        node.* = .{ .val = v };
        var cur = &self.root;
        while (cur.*) |n| {
            cur = if (v < n.val) &n.left else &n.right;
        }
        cur.* = node;
    }

    fn delete(node: ?*Node, v: i64) ?*Node {
        const n = node orelse return null;
        if (v < n.val) {
            n.left = delete(n.left, v);
        } else if (v > n.val) {
            n.right = delete(n.right, v);
        } else {
            if (n.left == null) return n.right;
            if (n.right == null) return n.left;
            var succ = n.right.?;
            while (succ.left) |sl| succ = sl;
            n.val = succ.val;
            n.right = delete(n.right, succ.val);
        }
        return n;
    }

    fn inorder(node: ?*Node, first: *bool) void {
        const n = node orelse return;
        inorder(n.left, first);
        if (!first.*) std.debug.print(" ", .{});
        first.* = false;
        std.debug.print("{d}", .{n.val});
        inorder(n.right, first);
    }
};

pub fn main() void {
    var tree = Tree{};
    for ([_]i64{ 5, 3, 8, 1, 4 }) |v| tree.insert(v);
    tree.root = Tree.delete(tree.root, 3);

    var first = true;
    Tree.inorder(tree.root, &first);
    std.debug.print("\n", .{});
}
