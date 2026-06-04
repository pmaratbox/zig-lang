const std = @import("std");

const EvenStream = struct {
    next: u32 = 1,
    fn pull(self: *EvenStream) u32 {
        while (true) {
            const v = self.next;
            self.next += 1;
            if (v % 2 == 0) return v;
        }
    }
};

pub fn main() void {
    var s = EvenStream{};
    var i: usize = 0;
    while (i < 3) : (i += 1) {
        if (i != 0) std.debug.print(" ", .{});
        std.debug.print("{d}", .{s.pull()});
    }
    std.debug.print("\n", .{});
}
