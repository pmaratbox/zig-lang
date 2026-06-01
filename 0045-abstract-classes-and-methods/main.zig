const std = @import("std");

const Shape = struct {
    side: i32,
    areaFn: *const fn (i32) i32,

    fn describe(self: Shape) void {
        std.debug.print("area: {d}\n", .{self.areaFn(self.side)});
    }
};

fn squareArea(side: i32) i32 {
    return side * side;
}

pub fn main() void {
    const sq = Shape{ .side = 3, .areaFn = squareArea };
    sq.describe();
}
