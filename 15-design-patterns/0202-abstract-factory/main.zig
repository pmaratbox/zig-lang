const std = @import("std");

const Button = struct { label: []const u8 };
const Checkbox = struct { label: []const u8 };

const ThemeFactory = struct {
    theme: []const u8,

    fn makeButton(self: ThemeFactory) Button {
        return .{ .label = if (std.mem.eql(u8, self.theme, "dark")) "dark-button" else "light-button" };
    }

    fn makeCheckbox(self: ThemeFactory) Checkbox {
        return .{ .label = if (std.mem.eql(u8, self.theme, "dark")) "dark-checkbox" else "light-checkbox" };
    }
};

pub fn main() void {
    const f = ThemeFactory{ .theme = "dark" };
    const b = f.makeButton();
    const c = f.makeCheckbox();
    std.debug.print("{s} {s}\n", .{ b.label, c.label });
}
