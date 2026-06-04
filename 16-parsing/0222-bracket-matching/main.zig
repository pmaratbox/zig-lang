const std = @import("std");

fn balanced(s: []const u8) bool {
    var stack: [64]u8 = undefined;
    var top: usize = 0;
    for (s) |c| {
        switch (c) {
            '(', '[', '{' => {
                stack[top] = c;
                top += 1;
            },
            ')', ']', '}' => {
                if (top == 0) return false;
                top -= 1;
                const open = stack[top];
                const ok = (c == ')' and open == '(') or
                    (c == ']' and open == '[') or
                    (c == '}' and open == '{');
                if (!ok) return false;
            },
            else => {},
        }
    }
    return top == 0;
}

pub fn main() void {
    const a = if (balanced("([{}])")) "yes" else "no";
    const b = if (balanced("([)]")) "yes" else "no";
    std.debug.print("{s} {s}\n", .{ a, b });
}
