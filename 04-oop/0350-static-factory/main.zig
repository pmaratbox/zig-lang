const std = @import("std");

const Color = struct {
    r: u8,
    g: u8,
    b: u8,

    // Static factory: parse "#rrggbb" hex pairs into components.
    fn fromHex(hex: []const u8) Color {
        const digits = hex[1..];
        return .{
            .r = std.fmt.parseInt(u8, digits[0..2], 16) catch 0,
            .g = std.fmt.parseInt(u8, digits[2..4], 16) catch 0,
            .b = std.fmt.parseInt(u8, digits[4..6], 16) catch 0,
        };
    }
};

pub fn main() void {
    const c = Color.fromHex("#ff0000");
    std.debug.print("{d} {d} {d}\n", .{ c.r, c.g, c.b });
}
