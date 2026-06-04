const std = @import("std");

const Counter = struct {
    calls: usize = 0,

    fn call(self: *Counter) void {
        self.calls += 1;
    }
};

pub fn main() void {
    var c = Counter{};
    var i: usize = 0;
    while (i < 5) : (i += 1) {
        c.call();
    }
    std.debug.print("calls: {d}\n", .{c.calls});
}
