const std = @import("std");

const Options = struct { greeting: []const u8 = "Hello" };

fn greet(name: []const u8, opts: Options) void {
    std.debug.print("{s}, {s}\n", .{ opts.greeting, name });
}

pub fn main() void {
    greet("Ada", .{});
    greet("Ada", .{ .greeting = "Hi" });
}
