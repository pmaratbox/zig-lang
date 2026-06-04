const std = @import("std");

// days-from-civil: days since 1970-01-01 (Howard Hinnant's algorithm)
fn daysFromCivil(y_in: i64, m: i64, d: i64) i64 {
    const y = if (m <= 2) y_in - 1 else y_in;
    const era = @divFloor(if (y >= 0) y else y - 399, 400);
    const yoe = y - era * 400;
    const doy = @divFloor(153 * (if (m > 2) m - 3 else m + 9) + 2, 5) + d - 1;
    const doe = yoe * 365 + @divFloor(yoe, 4) - @divFloor(yoe, 100) + doy;
    return era * 146097 + doe - 719468;
}

pub fn main() void {
    const a = daysFromCivil(2000, 1, 1);
    const b = daysFromCivil(2000, 12, 31);
    std.debug.print("{d}\n", .{b - a});
}
