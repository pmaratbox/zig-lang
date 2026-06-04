const std = @import("std");

const Find = struct {
    parent: [4]usize = .{ 0, 1, 2, 3 },

    fn find(self: *Find, x: usize) usize {
        var root = x;
        while (self.parent[root] != root) root = self.parent[root];
        self.parent[x] = root;
        return root;
    }

    fn unite(self: *Find, a: usize, b: usize) void {
        self.parent[self.find(a)] = self.find(b);
    }

    fn connected(self: *Find, a: usize, b: usize) bool {
        return self.find(a) == self.find(b);
    }
};

pub fn main() void {
    var uf = Find{};
    uf.unite(0, 1);
    uf.unite(2, 3);

    std.debug.print("{s} {s}\n", .{
        if (uf.connected(0, 1)) "yes" else "no",
        if (uf.connected(0, 2)) "yes" else "no",
    });
}
