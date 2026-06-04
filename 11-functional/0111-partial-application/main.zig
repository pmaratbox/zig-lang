const std = @import("std");

fn add(a: i32, b: i32) i32 {
    return a + b;
}

const Bound = struct {
    a: i32,
    fn call(self: Bound, b: i32) i32 {
        return add(self.a, b);
    }
};

fn bindFirst(a: i32) Bound {
    return Bound{ .a = a };
}

pub fn main() void {
    const add10 = bindFirst(10);
    std.debug.print("{d}\n", .{add10.call(3)});
}
