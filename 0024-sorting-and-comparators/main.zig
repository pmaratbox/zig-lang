const std = @import("std");

fn printRow(label: []const u8, arr: []const i32) void {
    std.debug.print("{s}:", .{label});
    for (arr) |x| {
        std.debug.print(" {d}", .{x});
    }
    std.debug.print("\n", .{});
}

pub fn main() void {
    var asc = [_]i32{ 3, 1, 2 };
    var desc = [_]i32{ 3, 1, 2 };
    std.mem.sort(i32, &asc, {}, std.sort.asc(i32));
    std.mem.sort(i32, &desc, {}, std.sort.desc(i32));
    printRow("asc", &asc);
    printRow("desc", &desc);
}
