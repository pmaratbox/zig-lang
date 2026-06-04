const std = @import("std");

const Adder = struct {
    a: i32,
    fn call(self: Adder, b: i32) i32 {
        return self.a + b;
    }
};

fn add(a: i32) Adder {
    return Adder{ .a = a };
}

pub fn main() void {
    std.debug.print("{d}\n", .{add(2).call(3)});
}
