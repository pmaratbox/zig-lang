const std = @import("std");

const Person = struct { id: u32, name: []const u8 };

pub fn main() !void {
    const allocator = std.heap.page_allocator;

    const people = [_]Person{
        .{ .id = 1, .name = "alice" },
        .{ .id = 2, .name = "bob" },
    };

    var by_id = std.AutoHashMap(u32, []const u8).init(allocator);
    defer by_id.deinit();

    for (people) |p| try by_id.put(p.id, p.name);

    const name = by_id.get(2) orelse "?";
    std.debug.print("id 2: {s}\n", .{name});
}
