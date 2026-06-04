const std = @import("std");

const WithMin = struct {
    data: [16]i32 = undefined,
    mins: [16]i32 = undefined,
    len: usize = 0,

    fn push(self: *WithMin, v: i32) void {
        self.data[self.len] = v;
        if (self.len == 0 or v < self.mins[self.len - 1]) {
            self.mins[self.len] = v;
        } else {
            self.mins[self.len] = self.mins[self.len - 1];
        }
        self.len += 1;
    }

    fn getMin(self: *WithMin) i32 {
        return self.mins[self.len - 1];
    }
};

pub fn main() void {
    var stack = WithMin{};
    stack.push(3);
    stack.push(1);
    stack.push(2);
    std.debug.print("min: {d}\n", .{stack.getMin()});
}
