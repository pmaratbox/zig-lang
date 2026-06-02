const std = @import("std");

pub fn main() void {
    const words = [_][]const u8{ "one", "two", "three" };

    var maxlen: usize = 0;
    for (words) |w| {
        if (w.len > maxlen) maxlen = w.len;
    }

    var first_group = true;
    var len: usize = 1;
    while (len <= maxlen) : (len += 1) {
        var any = false;
        for (words) |w| {
            if (w.len == len) {
                any = true;
                break;
            }
        }
        if (!any) continue;

        if (!first_group) std.debug.print(" ", .{});
        std.debug.print("{d}:[", .{len});
        var first_word = true;
        for (words) |w| {
            if (w.len == len) {
                if (!first_word) std.debug.print(",", .{});
                std.debug.print("{s}", .{w});
                first_word = false;
            }
        }
        std.debug.print("]", .{});
        first_group = false;
    }
    std.debug.print("\n", .{});
}
