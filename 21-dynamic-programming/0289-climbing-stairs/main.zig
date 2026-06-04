const std = @import("std");

pub fn main() void {
    const n: usize = 5;
    var a: usize = 1;
    var b: usize = 1;
    var i: usize = 0;
    while (i < n) : (i += 1) {
        const next = a + b;
        a = b;
        b = next;
    }
    std.debug.print("{d}\n", .{a});
}
