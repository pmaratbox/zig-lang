const std = @import("std");

const Entry = struct { k: []const u8, v: i32 };

pub fn main() void {
    const m = [_]Entry{ .{ .k = "a", .v = 1 }, .{ .k = "b", .v = 2 }, .{ .k = "c", .v = 3 } };
    var first = true;
    var v: i32 = 1;
    while (v <= 3) : (v += 1) {
        for (m) |e| {
            if (e.v == v) {
                if (!first) std.debug.print(" ", .{});
                std.debug.print("{d}:{s}", .{ v, e.k });
                first = false;
            }
        }
    }
    std.debug.print("\n", .{});
}
