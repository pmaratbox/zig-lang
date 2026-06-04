const std = @import("std");

const N = 5;

const SegTree = struct {
    tree: [4 * N]i64 = [_]i64{0} ** (4 * N),
    data: [N]i64,

    fn build(self: *SegTree, node: usize, lo: usize, hi: usize) void {
        if (lo == hi) {
            self.tree[node] = self.data[lo];
            return;
        }
        const mid = (lo + hi) / 2;
        self.build(2 * node, lo, mid);
        self.build(2 * node + 1, mid + 1, hi);
        self.tree[node] = self.tree[2 * node] + self.tree[2 * node + 1];
    }

    fn query(self: *SegTree, node: usize, lo: usize, hi: usize, l: usize, r: usize) i64 {
        if (r < lo or hi < l) return 0;
        if (l <= lo and hi <= r) return self.tree[node];
        const mid = (lo + hi) / 2;
        return self.query(2 * node, lo, mid, l, r) +
            self.query(2 * node + 1, mid + 1, hi, l, r);
    }
};

pub fn main() void {
    var st = SegTree{ .data = [_]i64{ 1, 2, 3, 4, 5 } };
    st.build(1, 0, N - 1);
    std.debug.print("{d}\n", .{st.query(1, 0, N - 1, 1, 3)});
}
