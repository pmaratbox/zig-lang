const std = @import("std");

fn isBalanced(s: []const u8) bool {
    var stack: [64]u8 = undefined;
    var top: usize = 0;
    for (s) |ch| {
        if (ch == '(') {
            stack[top] = ch;
            top += 1;
        } else if (ch == ')') {
            if (top == 0) return false;
            top -= 1;
        }
    }
    return top == 0;
}

pub fn main() void {
    const inputs = [_][]const u8{ "(())", "(()" };
    for (inputs) |s| {
        std.debug.print("{s}\n", .{if (isBalanced(s)) "yes" else "no"});
    }
}
