const std = @import("std");

const Buffer = struct {
    data: [3]i32 = undefined,
    head: usize = 0,
    len: usize = 0,

    fn push(self: *Buffer, v: i32) void {
        const idx = (self.head + self.len) % 3;
        if (self.len < 3) {
            self.len += 1;
        } else {
            self.head = (self.head + 1) % 3;
        }
        self.data[idx] = v;
    }
};

pub fn main() void {
    var buf = Buffer{};
    for ([_]i32{ 1, 2, 3, 4, 5 }) |v| buf.push(v);

    var i: usize = 0;
    while (i < buf.len) : (i += 1) {
        if (i != 0) std.debug.print(" ", .{});
        std.debug.print("{d}", .{buf.data[(buf.head + i) % 3]});
    }
    std.debug.print("\n", .{});
}
