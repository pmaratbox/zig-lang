const std = @import("std");

fn sortedKey(word: []const u8, buf: []u8) []const u8 {
    std.mem.copyForwards(u8, buf[0..word.len], word);
    std.mem.sort(u8, buf[0..word.len], {}, std.sort.asc(u8));
    return buf[0..word.len];
}

pub fn main() void {
    const words = [_][]const u8{ "eat", "tea", "tan", "ate", "nat" };

    var keys: [words.len][16]u8 = undefined;
    var key_slices: [words.len][]const u8 = undefined;
    var count: usize = 0;

    for (words) |w| {
        const key = sortedKey(w, keys[count][0..]);
        var found = false;
        var k: usize = 0;
        while (k < count) : (k += 1) {
            if (std.mem.eql(u8, key_slices[k], key)) {
                found = true;
                break;
            }
        }
        if (!found) {
            key_slices[count] = key;
            count += 1;
        }
    }

    std.debug.print("{d}\n", .{count});
}
