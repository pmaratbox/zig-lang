const std = @import("std");
const mathutil = @import("mathutil.zig");

pub fn main() void {
    std.debug.print("square(8) = {d}\n", .{mathutil.square(8)});
}
