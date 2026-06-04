const std = @import("std");

const Leaf = struct {
    value: i32,

    fn accept(self: Leaf, visitor: *SumVisitor) void {
        visitor.visit(self);
    }
};

const SumVisitor = struct {
    total: i32 = 0,

    fn visit(self: *SumVisitor, leaf: Leaf) void {
        self.total += leaf.value;
    }
};

pub fn main() void {
    const leaves = [_]Leaf{ .{ .value = 1 }, .{ .value = 2 }, .{ .value = 3 } };
    var visitor = SumVisitor{};
    for (leaves) |leaf| leaf.accept(&visitor);
    std.debug.print("{d}\n", .{visitor.total});
}
