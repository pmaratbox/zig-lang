const std = @import("std");

const RealSubject = struct {
    fn request(_: RealSubject) []const u8 {
        return "loaded";
    }
};

const Proxy = struct {
    real: ?RealSubject = null,

    fn request(self: *Proxy) []const u8 {
        if (self.real == null) {
            self.real = RealSubject{};
        }
        return self.real.?.request();
    }
};

pub fn main() void {
    var proxy = Proxy{};
    std.debug.print("{s}\n", .{proxy.request()});
}
