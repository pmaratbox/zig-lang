const std = @import("std");

pub fn main() void {
    const nums = [_]i32{ 1, 3, 5, 7, 9 };
    const target: i32 = 7;

    var lo: usize = 0;
    var hi: usize = nums.len - 1;
    var index: isize = -1;
    while (lo <= hi) {
        const mid = lo + (hi - lo) / 2;
        if (nums[mid] == target) {
            index = @intCast(mid);
            break;
        } else if (nums[mid] < target) {
            lo = mid + 1;
        } else {
            if (mid == 0) break;
            hi = mid - 1;
        }
    }

    std.debug.print("found {d} at index {d}\n", .{ target, index });
}
