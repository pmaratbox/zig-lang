const std = @import("std");

const CheckError = error{TooLarge};

fn check(n: i32) CheckError!void {
    if (n > 100) {
        return CheckError.TooLarge;
    }
}

pub fn main() void {
    check(200) catch |err| switch (err) {
        error.TooLarge => std.debug.print("error: value too large\n", .{}),
    };
}
