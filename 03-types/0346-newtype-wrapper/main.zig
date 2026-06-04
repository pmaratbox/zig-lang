const std = @import("std");

const UserId = struct { value: u64 };
const ProductId = struct { value: u64 };

pub fn main() void {
    const u = UserId{ .value = 1 };
    const p = ProductId{ .value = 2 };
    std.debug.print("user-{d} prod-{d}\n", .{ u.value, p.value });
}
