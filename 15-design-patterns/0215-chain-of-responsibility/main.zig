const std = @import("std");

const Handler = struct {
    level: i32,
    next: ?*const Handler,

    fn handle(self: *const Handler, request: i32) void {
        if (self.level == request) {
            std.debug.print("handled by {d}\n", .{self.level});
        } else if (self.next) |n| {
            n.handle(request);
        }
    }
};

pub fn main() void {
    const h3 = Handler{ .level = 3, .next = null };
    const h2 = Handler{ .level = 2, .next = &h3 };
    const h1 = Handler{ .level = 1, .next = &h2 };
    h1.handle(2);
}
