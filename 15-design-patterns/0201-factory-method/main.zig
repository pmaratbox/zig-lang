const std = @import("std");

const Shape = struct {
    kind: []const u8,
};

fn createShape(name: []const u8) Shape {
    if (std.mem.eql(u8, name, "circle")) return .{ .kind = "circle" };
    return .{ .kind = "square" };
}

pub fn main() void {
    const a = createShape("circle");
    const b = createShape("square");
    std.debug.print("{s} {s}\n", .{ a.kind, b.kind });
}
