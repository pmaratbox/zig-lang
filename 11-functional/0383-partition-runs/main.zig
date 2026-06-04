const std = @import("std");

pub fn main() void {
    const data = [_]u32{ 1, 1, 2, 3, 3, 3 };
    var i: usize = 0;
    var first_run = true;
    while (i < data.len) {
        var j = i + 1;
        while (j < data.len and data[j] == data[i]) : (j += 1) {}
        if (!first_run) std.debug.print("|", .{});
        first_run = false;
        var k = i;
        while (k < j) : (k += 1) {
            if (k > i) std.debug.print(" ", .{});
            std.debug.print("{d}", .{data[k]});
        }
        i = j;
    }
    std.debug.print("\n", .{});
}
