const std = @import("std");

const Config = struct {
    value: i32 = 42,

    var instance: ?Config = null;

    fn getInstance() *Config {
        if (Config.instance == null) {
            Config.instance = Config{};
        }
        return &Config.instance.?;
    }
};

pub fn main() void {
    const a = Config.getInstance();
    const b = Config.getInstance();
    std.debug.print("same: {s}\n", .{if (a == b) "yes" else "no"});
}
