const std = @import("std");

fn weekday(y_in: i32, m_in: i32, d: i32) []const u8 {
    var y = y_in;
    var m = m_in;
    if (m < 3) {
        m += 12;
        y -= 1;
    }
    const k = @mod(y, 100);
    const j = @divFloor(y, 100);
    const h = @mod(d + @divFloor(13 * (m + 1), 5) + k + @divFloor(k, 4) + @divFloor(j, 4) + 5 * j, 7);
    // Zeller: 0=Saturday, 1=Sunday, ... 6=Friday
    const names = [_][]const u8{ "Saturday", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday" };
    return names[@intCast(h)];
}

pub fn main() void {
    std.debug.print("{s}\n", .{weekday(2000, 1, 1)});
}
