const std = @import("std");

pub fn main() void {
    const encoder = std.base64.standard.Encoder;
    const input = "hi";
    var buf: [8]u8 = undefined;
    const encoded = encoder.encode(&buf, input);
    std.debug.print("{s}\n", .{encoded});
}
