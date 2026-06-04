const std = @import("std");

const Prototype = struct {
    value: i32,

    fn clone(self: Prototype) Prototype {
        return .{ .value = self.value };
    }
};

pub fn main() void {
    const original = Prototype{ .value = 1 };
    var copy = original.clone();
    copy.value = 2;
    std.debug.print("{d} {d}\n", .{ original.value, copy.value });
}
