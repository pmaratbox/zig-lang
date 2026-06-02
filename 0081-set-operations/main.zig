const std = @import("std");

fn contains(set: []const i32, v: i32) bool {
    for (set) |x| {
        if (x == v) return true;
    }
    return false;
}

pub fn main() void {
    const a = [_]i32{ 1, 2, 3 };
    const b = [_]i32{ 2, 3, 4 };

    var first = true;
    var v: i32 = 1;
    while (v <= 4) : (v += 1) {
        if (contains(&a, v) or contains(&b, v)) {
            if (!first) std.debug.print(" ", .{});
            std.debug.print("{d}", .{v});
            first = false;
        }
    }
    std.debug.print("\n", .{});

    first = true;
    v = 1;
    while (v <= 4) : (v += 1) {
        if (contains(&a, v) and contains(&b, v)) {
            if (!first) std.debug.print(" ", .{});
            std.debug.print("{d}", .{v});
            first = false;
        }
    }
    std.debug.print("\n", .{});
}
