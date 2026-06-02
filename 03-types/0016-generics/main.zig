const std = @import("std");

fn first(comptime T: type, items: []const T) T {
    return items[0];
}

pub fn main() void {
    const ints = [_]i32{ 1, 2, 3 };
    const strs = [_][]const u8{ "a", "b", "c" };

    std.debug.print("first int: {}\n", .{first(i32, &ints)});
    std.debug.print("first string: {s}\n", .{first([]const u8, &strs)});
}
