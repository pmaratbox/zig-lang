const std = @import("std");

const Algorithm = struct {
    stepFn: *const fn () []const u8,

    fn run(self: Algorithm) void {
        std.debug.print("start {s} end\n", .{self.stepFn()});
    }
};

fn workStep() []const u8 {
    return "work";
}

pub fn main() void {
    const algo = Algorithm{ .stepFn = &workStep };
    algo.run();
}
