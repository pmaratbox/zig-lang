const std = @import("std");

// A default greet() lives on the "interface" struct; types may override it.
const Default = struct {
    fn greet() []const u8 {
        return "hi";
    }
};

const Override = struct {
    fn greet() []const u8 {
        return "hey";
    }
};

pub fn main() void {
    std.debug.print("{s} {s}\n", .{ Default.greet(), Override.greet() });
}
