const std = @import("std");

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    var sb: std.ArrayList(u8) = .empty;
    defer sb.deinit(allocator);
    const nums = [_]i32{ 1, 2, 3 };
    var tmp: [16]u8 = undefined;
    for (nums, 0..) |n, i| {
        if (i > 0) try sb.append(allocator, '-');
        const formatted = std.fmt.bufPrint(&tmp, "{d}", .{n}) catch unreachable;
        try sb.appendSlice(allocator, formatted);
    }
    std.debug.print("{s}\n", .{sb.items});
}
