const std = @import("std");

pub fn main() !void {
    var threaded = std.Io.Threaded.init_single_threaded;
    const io = threaded.io();
    const cwd = std.Io.Dir.cwd();
    const path = "greeting.txt";

    try cwd.writeFile(io, .{ .sub_path = path, .data = "hello, file" });

    var buf: [64]u8 = undefined;
    const content = try cwd.readFile(io, path, &buf);

    try cwd.deleteFile(io, path);

    std.debug.print("read: {s}\n", .{content});
}
