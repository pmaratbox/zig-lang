const std = @import("std");

const Level = enum(u8) {
    info = 0,
    warn = 1,
    err = 2,

    fn name(self: Level) []const u8 {
        return switch (self) {
            .info => "INFO",
            .warn => "WARN",
            .err => "ERROR",
        };
    }
};

pub fn main() void {
    const threshold = Level.warn;
    const messages = [_]struct { level: Level, msg: []const u8 }{
        .{ .level = .info, .msg = "i" },
        .{ .level = .warn, .msg = "w" },
        .{ .level = .err, .msg = "e" },
    };
    for (messages) |m| {
        if (@intFromEnum(m.level) >= @intFromEnum(threshold)) {
            std.debug.print("{s}: {s}\n", .{ m.level.name(), m.msg });
        }
    }
}
