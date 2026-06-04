const std = @import("std");

pub fn main() void {
    const ini = "[s]\nk=v\n";
    var section: []const u8 = "";
    var it = std.mem.tokenizeScalar(u8, ini, '\n');
    while (it.next()) |line| {
        if (line.len == 0) continue;
        if (line[0] == '[') {
            section = line[1 .. line.len - 1];
        } else if (std.mem.indexOfScalar(u8, line, '=')) |eq| {
            const key = line[0..eq];
            const val = line[eq + 1 ..];
            std.debug.print("{s}.{s}={s}\n", .{ section, key, val });
        }
    }
}
