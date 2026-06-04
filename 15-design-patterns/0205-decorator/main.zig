const std = @import("std");

const Coffee = struct {
    base: i32,

    fn cost(self: Coffee) i32 {
        return self.base;
    }
};

const Milk = struct {
    inner: i32,
    fn cost(self: Milk) i32 {
        return self.inner + 1;
    }
};

const Sugar = struct {
    inner: i32,
    fn cost(self: Sugar) i32 {
        return self.inner + 1;
    }
};

pub fn main() void {
    const base = Coffee{ .base = 2 };
    const withMilk = Milk{ .inner = base.cost() };
    const withSugar = Sugar{ .inner = withMilk.cost() };
    std.debug.print("{d}\n", .{withSugar.cost()});
}
