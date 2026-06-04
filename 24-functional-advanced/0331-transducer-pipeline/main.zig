const std = @import("std");

fn collect(out: *[8]i32, n: *usize, x: i32) void {
    out[n.*] = x;
    n.* += 1;
}

// mapping(+1) then filtering(even), composed into one pass.
fn step(out: *[8]i32, n: *usize, x: i32) void {
    const mapped = x + 1;
    if (@mod(mapped, 2) == 0) collect(out, n, mapped);
}

pub fn main() void {
    const input = [_]i32{ 1, 2, 3, 4 };
    var out: [8]i32 = undefined;
    var n: usize = 0;
    for (input) |x| step(&out, &n, x);

    for (out[0..n], 0..) |v, i| {
        if (i != 0) std.debug.print(" ", .{});
        std.debug.print("{d}", .{v});
    }
    std.debug.print("\n", .{});
}
