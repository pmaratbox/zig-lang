const std = @import("std");

pub fn main() !void {
    var threaded = std.Io.Threaded.init_single_threaded;
    const io = threaded.io();
    const cwd = std.Io.Dir.cwd();
    const path = "lines.txt";

    try cwd.writeFile(io, .{ .sub_path = path, .data = "first\nsecond\nthird\n" });

    var buf: [256]u8 = undefined;
    const content = try cwd.readFile(io, path, &buf);
    try cwd.deleteFile(io, path);

    var count: usize = 0;
    var it = std.mem.splitScalar(u8, content, '\n');
    while (it.next()) |line| {
        if (line.len > 0) count += 1;
    }

    std.debug.print("lines: {d}\n", .{count});
}
