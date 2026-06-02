const std = @import("std");

const Shape = union(enum) {
    rect: struct { w: i32, h: i32 },
    square: i32,
};

fn area(shape: Shape) i32 {
    return switch (shape) {
        .rect => |r| r.w * r.h,
        .square => |s| s * s,
    };
}

pub fn main() void {
    const shapes = [_]Shape{ .{ .rect = .{ .w = 2, .h = 3 } }, .{ .square = 4 } };
    for (shapes) |shape| {
        std.debug.print("{d}\n", .{area(shape)});
    }
}
