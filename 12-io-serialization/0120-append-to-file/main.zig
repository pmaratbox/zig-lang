const std = @import("std");

pub fn main() !void {
    var threaded = std.Io.Threaded.init_single_threaded;
    const io = threaded.io();
    const cwd = std.Io.Dir.cwd();
    const path = "two.txt";

    try cwd.writeFile(io, .{ .sub_path = path, .data = "a\n" });

    var file = try cwd.openFile(io, path, .{ .mode = .read_write });
    const end = try file.length(io);
    try file.writePositionalAll(io, "b\n", end);
    file.close(io);

    var buf: [256]u8 = undefined;
    const content = try cwd.readFile(io, path, &buf);
    try cwd.deleteFile(io, path);

    var first = true;
    var it = std.mem.splitScalar(u8, content, '\n');
    while (it.next()) |line| {
        if (line.len == 0) continue;
        if (!first) std.debug.print(" ", .{});
        std.debug.print("{s}", .{line});
        first = false;
    }
    std.debug.print("\n", .{});
}
