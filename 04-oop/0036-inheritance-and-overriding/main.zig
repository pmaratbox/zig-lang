const std = @import("std");

const Animal = union(enum) {
    generic,
    dog,

    fn speak(self: Animal) []const u8 {
        return switch (self) {
            .generic => "some sound",
            .dog => "Woof",
        };
    }
};

pub fn main() void {
    const animal: Animal = .generic;
    const dog: Animal = .dog;
    std.debug.print("animal: {s}\n", .{animal.speak()});
    std.debug.print("dog: {s}\n", .{dog.speak()});
}
