const std = @import("std");

fn printPerm(a: []const u8) void {
    var first = true;
    for (a) |x| {
        if (!first) std.debug.print(" ", .{});
        std.debug.print("{d}", .{x});
        first = false;
    }
    std.debug.print("\n", .{});
}

fn nextPerm(a: []u8) bool {
    if (a.len < 2) return false;
    var i: usize = a.len - 1;
    while (i > 0 and a[i - 1] >= a[i]) : (i -= 1) {}
    if (i == 0) return false;
    var j: usize = a.len - 1;
    while (a[j] <= a[i - 1]) : (j -= 1) {}
    std.mem.swap(u8, &a[i - 1], &a[j]);
    std.mem.reverse(u8, a[i..]);
    return true;
}

pub fn main() void {
    var a = [_]u8{ 1, 2, 3 };
    printPerm(&a);
    while (nextPerm(&a)) {
        printPerm(&a);
    }
}
