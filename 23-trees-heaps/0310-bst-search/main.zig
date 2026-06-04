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

    fn search(self: *Tree, v: i64) bool {
        var cur = self.root;
        while (cur) |n| {
            if (v == n.val) return true;
            cur = if (v < n.val) n.left else n.right;
        }
        return false;
    }
};

pub fn main() void {
    var tree = Tree{};
    for ([_]i64{ 5, 3, 8, 1, 4 }) |v| tree.insert(v);

    std.debug.print("{s} {s}\n", .{
        if (tree.search(4)) "yes" else "no",
        if (tree.search(6)) "yes" else "no",
    });
}
