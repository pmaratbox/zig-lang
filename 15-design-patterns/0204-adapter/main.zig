const std = @import("std");

const Celsius = struct {
    degrees: i32,
};

const FahrenheitAdapter = struct {
    source: Celsius,

    fn fahrenheit(self: FahrenheitAdapter) i32 {
        return @divTrunc(self.source.degrees * 9, 5) + 32;
    }
};

pub fn main() void {
    const adapter = FahrenheitAdapter{ .source = .{ .degrees = 100 } };
    std.debug.print("{d}\n", .{adapter.fahrenheit()});
}
