const std = @import("std");

pub fn main() void {
    const input = "a,b,c";
    var buf: [16]u8 = undefined;
    var len: usize = 0;
    var it = std.mem.splitScalar(u8, input, ',');
    var first = true;
    while (it.next()) |part| {
        if (!first) {
            buf[len] = '-';
            len += 1;
        }
        first = false;
        for (part) |c| {
            buf[len] = std.ascii.toUpper(c);
            len += 1;
        }
    }
    std.debug.print("{s}\n", .{buf[0..len]});
}
