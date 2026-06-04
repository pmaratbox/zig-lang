const std = @import("std");

pub fn main() !void {
    var threaded = std.Io.Threaded.init_single_threaded;
    const io = threaded.io();
    const cwd = std.Io.Dir.cwd();
    const path = "roundtrip.tmp";
    const data = "ok-data";

    try cwd.writeFile(io, .{ .sub_path = path, .data = data });

    var buf: [64]u8 = undefined;
    const read_back = try cwd.readFile(io, path, &buf);

    try cwd.deleteFile(io, path);

    if (std.mem.eql(u8, read_back, data)) {
        std.debug.print("roundtrip: ok\n", .{});
    } else {
        std.debug.print("roundtrip: mismatch\n", .{});
    }
}
