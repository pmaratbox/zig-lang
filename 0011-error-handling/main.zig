const std = @import("std");

const DivError = error{DivisionByZero};

fn divide(a: i32, b: i32) DivError!i32 {
    if (b == 0) {
        return DivError.DivisionByZero;
    }
    return @divTrunc(a, b);
}

pub fn main() void {
    if (divide(10, 2)) |result| {
        std.debug.print("10 / 2 = {}\n", .{result});
    } else |_| {
        std.debug.print("error: division by zero\n", .{});
    }

    if (divide(10, 0)) |result| {
        std.debug.print("10 / 2 = {}\n", .{result});
    } else |_| {
        std.debug.print("error: division by zero\n", .{});
    }
}
