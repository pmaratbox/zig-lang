const std = @import("std");

fn daysFromCivil(y_in: i64, m: i64, d: i64) i64 {
    const y = if (m <= 2) y_in - 1 else y_in;
    const era = @divFloor(if (y >= 0) y else y - 399, 400);
    const yoe = y - era * 400;
    const doy = @divFloor(153 * (if (m > 2) m - 3 else m + 9) + 2, 5) + d - 1;
    const doe = yoe * 365 + @divFloor(yoe, 4) - @divFloor(yoe, 100) + doy;
    return era * 146097 + doe - 719468;
}

const Date = struct { y: i64, m: i64, d: i64 };

fn civilFromDays(z_in: i64) Date {
    const z = z_in + 719468;
    const era = @divFloor(if (z >= 0) z else z - 146096, 146097);
    const doe = z - era * 146097;
    const yoe = @divFloor(doe - @divFloor(doe, 1460) + @divFloor(doe, 36524) - @divFloor(doe, 146096), 365);
    const y = yoe + era * 400;
    const doy = doe - (365 * yoe + @divFloor(yoe, 4) - @divFloor(yoe, 100));
    const mp = @divFloor(5 * doy + 2, 153);
    const d = doy - @divFloor(153 * mp + 2, 5) + 1;
    const m = if (mp < 10) mp + 3 else mp - 9;
    return Date{ .y = if (m <= 2) y + 1 else y, .m = m, .d = d };
}

pub fn main() void {
    const start = daysFromCivil(2000, 1, 1);
    const date = civilFromDays(start + 40);
    const y: u32 = @intCast(date.y);
    const m: u32 = @intCast(date.m);
    const d: u32 = @intCast(date.d);
    std.debug.print("{d:0>4}-{d:0>2}-{d:0>2}\n", .{ y, m, d });
}
