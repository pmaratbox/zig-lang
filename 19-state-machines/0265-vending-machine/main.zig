const std = @import("std");

pub fn main() void {
    const coins = [_]u32{ 10, 10, 5 };
    const price: u32 = 25;
    var total: u32 = 0;
    var dispensed = false;
    for (coins) |c| {
        total += c;
        if (total >= price and !dispensed) {
            dispensed = true;
            std.debug.print("dispensed\n", .{});
        }
    }
}
