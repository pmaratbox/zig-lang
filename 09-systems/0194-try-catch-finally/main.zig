const std = @import("std");

const CatchFinallyError = error{Boom};

fn mayFail() CatchFinallyError!void {
    return CatchFinallyError.Boom;
}

pub fn main() void {
    defer std.debug.print("cleanup\n", .{});
    mayFail() catch {
        std.debug.print("caught\n", .{});
    };
}
