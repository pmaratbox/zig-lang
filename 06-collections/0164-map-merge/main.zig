const std = @import("std");

pub fn main() !void {
    const allocator = std.heap.page_allocator;

    var map = std.AutoHashMap(u8, u32).init(allocator);
    defer map.deinit();

    // left then right; right is applied last so it wins on conflicts.
    const left_keys = [_]u8{ 'a', 'b' };
    const left_vals = [_]u32{ 1, 2 };
    const right_keys = [_]u8{ 'b', 'c' };
    const right_vals = [_]u32{ 3, 4 };

    for (left_keys, left_vals) |k, v| try map.put(k, v);
    for (right_keys, right_vals) |k, v| try map.put(k, v);

    // Print sorted by key (ASCII byte order).
    var first = true;
    var c: u8 = 0;
    while (c <= 'z') : (c += 1) {
        if (map.get(c)) |v| {
            if (!first) std.debug.print(" ", .{});
            std.debug.print("{c}:{d}", .{ c, v });
            first = false;
        }
    }
    std.debug.print("\n", .{});
}
