const std = @import("std");

const RangeIterator = struct {
    current: i32,
    end: i32,

    fn hasNext(self: RangeIterator) bool {
        return self.current <= self.end;
    }

    fn next(self: *RangeIterator) i32 {
        const value = self.current;
        self.current += 1;
        return value;
    }
};

pub fn main() void {
    var it = RangeIterator{ .current = 1, .end = 3 };
    var first = true;
    while (it.hasNext()) {
        const v = it.next();
        if (!first) std.debug.print(" ", .{});
        std.debug.print("{d}", .{v});
        first = false;
    }
    std.debug.print("\n", .{});
}
