const std = @import("std");

const C = struct { c: i64 };
const B = struct { b: ?C };
const A = struct { a: ?B };

fn deep(x: A) i64 {
    const b = x.a orelse return 0;
    const c = b.b orelse return 0;
    return c.c;
}

pub fn main() void {
    const present = A{ .a = B{ .b = C{ .c = 5 } } };
    const absent = A{ .a = B{ .b = null } };
    std.debug.print("{d} {d}\n", .{ deep(present), deep(absent) });
}
