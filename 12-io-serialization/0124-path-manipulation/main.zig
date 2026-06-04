const std = @import("std");

pub fn main() !void {
    const allocator = std.heap.page_allocator;

    const joined = try std.fs.path.join(allocator, &.{ "/tmp", "file.txt" });
    defer allocator.free(joined);

    const base = std.fs.path.basename(joined);
    const ext = std.fs.path.extension(joined);

    std.debug.print("{s} {s} {s}\n", .{ joined, base, ext });
}
