const std = @import("std");

pub fn main() void {
    const json = "{\"x\":1,\"y\":2}";
    // hand-parse a flat numeric object
    var first = true;
    var i: usize = 0;
    while (i < json.len) {
        if (json[i] == '"') {
            const start = i + 1;
            var j = start;
            while (json[j] != '"') : (j += 1) {}
            const key = json[start..j];
            // skip closing quote and colon
            j += 2;
            var k = j;
            while (k < json.len and json[k] >= '0' and json[k] <= '9') : (k += 1) {}
            const val = json[j..k];
            if (!first) std.debug.print(" ", .{});
            std.debug.print("{s}={s}", .{ key, val });
            first = false;
            i = k;
        } else {
            i += 1;
        }
    }
    std.debug.print("\n", .{});
}
