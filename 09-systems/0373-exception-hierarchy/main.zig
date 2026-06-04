const std = @import("std");

// Zig has no class hierarchy for errors; we model a "base" category as an
// error set that contains the specific subtype, so the supertype set catches it.
const BaseError = error{ Specific, Other };

fn doWork() BaseError!void {
    return BaseError.Specific;
}

pub fn main() void {
    // Handle through the base set: any member is caught here.
    doWork() catch {
        std.debug.print("caught base\n", .{});
    };
}
