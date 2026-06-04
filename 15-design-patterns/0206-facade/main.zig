const std = @import("std");

const Sub1 = struct {
    fn init(_: Sub1) void {}
};
const Sub2 = struct {
    fn init(_: Sub2) void {}
};
const Sub3 = struct {
    fn init(_: Sub3) void {}
};

const Facade = struct {
    fn start(_: Facade) []const u8 {
        (Sub1{}).init();
        (Sub2{}).init();
        (Sub3{}).init();
        return "ready";
    }
};

pub fn main() void {
    const f = Facade{};
    std.debug.print("{s}\n", .{f.start()});
}
