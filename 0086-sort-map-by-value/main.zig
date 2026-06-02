const std = @import("std");

const Entry = struct { k: []const u8, v: i32 };

fn lessThan(_: void, a: Entry, b: Entry) bool {
    return a.v < b.v;
}

pub fn main() void {
    var entries = [_]Entry{ .{ .k = "a", .v = 3 }, .{ .k = "b", .v = 1 }, .{ .k = "c", .v = 2 } };
    std.mem.sort(Entry, &entries, {}, lessThan);
    for (entries, 0..) |e, i| {
        if (i > 0) std.debug.print(" ", .{});
        std.debug.print("{s}:{d}", .{ e.k, e.v });
    }
    std.debug.print("\n", .{});
}
