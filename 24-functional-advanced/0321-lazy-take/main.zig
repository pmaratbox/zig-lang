const std = @import("std");

const Naturals = struct {
    next: u32 = 1,
    fn take(self: *Naturals) u32 {
        const v = self.next;
        self.next += 1;
        return v;
    }
};

pub fn main() void {
    var nats = Naturals{};
    var i: usize = 0;
    while (i < 5) : (i += 1) {
        if (i != 0) std.debug.print(" ", .{});
        std.debug.print("{d}", .{nats.take()});
    }
    std.debug.print("\n", .{});
}
