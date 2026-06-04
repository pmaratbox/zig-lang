const std = @import("std");

const Node = struct {
    val: i64,
    left: ?*Node = null,
    right: ?*Node = null,
};

fn valid(node: ?*Node, low: i64, high: i64) bool {
    const n = node orelse return true;
    if (n.val <= low or n.val >= high) return false;
    return valid(n.left, low, n.val) and valid(n.right, n.val, high);
}

pub fn main() void {
    // Correct BST: 2 over (1,3)
    var a1 = Node{ .val = 1 };
    var a3 = Node{ .val = 3 };
    var a2 = Node{ .val = 2, .left = &a1, .right = &a3 };

    // Invalid BST: 2 over (1, 3 with left child 0 — out of place)
    var b0 = Node{ .val = 0 };
    var b1 = Node{ .val = 1 };
    var b3 = Node{ .val = 3, .left = &b0 };
    var b2 = Node{ .val = 2, .left = &b1, .right = &b3 };

    const r1 = valid(&a2, std.math.minInt(i64), std.math.maxInt(i64));
    const r2 = valid(&b2, std.math.minInt(i64), std.math.maxInt(i64));

    std.debug.print("{s} {s}\n", .{ if (r1) "yes" else "no", if (r2) "yes" else "no" });
}
