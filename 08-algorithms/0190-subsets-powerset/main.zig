const std = @import("std");

pub fn main() void {
    const elems = [_]u8{ 1, 2, 3 };
    var mask: u8 = 0;
    while (mask < (@as(u8, 1) << elems.len)) : (mask += 1) {
        if (mask == 0) {
            std.debug.print("{{}}\n", .{});
            continue;
        }
        var first = true;
        for (elems, 0..) |e, i| {
            if ((mask >> @intCast(i)) & 1 == 1) {
                if (!first) std.debug.print(" ", .{});
                std.debug.print("{d}", .{e});
                first = false;
            }
        }
        std.debug.print("\n", .{});
    }
}
