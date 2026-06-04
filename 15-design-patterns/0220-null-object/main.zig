const std = @import("std");

const NullLogger = struct {
    fn log(_: NullLogger, _: *i32) void {}
};

const RealLogger = struct {
    fn log(_: RealLogger, count: *i32) void {
        count.* += 1;
    }
};

pub fn main() void {
    var count: i32 = 0;
    const nullLogger = NullLogger{};
    const realLogger = RealLogger{};
    nullLogger.log(&count);
    realLogger.log(&count);
    std.debug.print("{d}\n", .{count});
}
