const std = @import("std");

pub fn main(init: std.process.Init.Minimal) void {
    var args = std.process.Args.Iterator.init(init.args);
    _ = args.next();
    const name = args.next().?;
    std.debug.print("hello, {s}\n", .{name});
}
