const std = @import("std");

const Counter = struct {
    count: i32 = 0,

    fn next(self: *Counter) i32 {
        self.count += 1;
        return self.count;
    }
};

pub fn main() void {
    var c = Counter{};
    std.debug.print("count: {}\n", .{c.next()});
    std.debug.print("count: {}\n", .{c.next()});
}
