const std = @import("std");

const Widget = struct {
    // Class-level counter shared across all instances.
    var count: usize = 0;

    fn init() Widget {
        count += 1;
        return .{};
    }
};

pub fn main() void {
    _ = Widget.init();
    _ = Widget.init();
    _ = Widget.init();
    std.debug.print("{d}\n", .{Widget.count});
}
