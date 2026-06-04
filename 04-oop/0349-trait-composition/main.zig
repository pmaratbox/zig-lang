const std = @import("std");

const A = struct {
    fn doA() []const u8 {
        return "a";
    }
};

const B = struct {
    fn doB() []const u8 {
        return "b";
    }
};

// Compose both capabilities by embedding their structs.
const AB = struct {
    a: A = .{},
    b: B = .{},
};

pub fn main() void {
    const x = AB{};
    std.debug.print("{s} {s}\n", .{ @TypeOf(x.a).doA(), @TypeOf(x.b).doB() });
}
