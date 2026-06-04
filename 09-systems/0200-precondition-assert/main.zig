const std = @import("std");

const AssertError = error{NotPositive};

fn check(arg: i32) AssertError!void {
    if (arg <= 0) return AssertError.NotPositive;
}

fn run(arg: i32) void {
    check(arg) catch {
        std.debug.print("error: must be positive\n", .{});
        return;
    };
    std.debug.print("ok\n", .{});
}

pub fn main() void {
    run(5);
    run(-1);
}
