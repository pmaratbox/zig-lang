const std = @import("std");

const Person = struct {
    name: []const u8,
    age: u32,

    fn byAge(_: void, a: Person, b: Person) bool {
        return a.age < b.age;
    }
};

pub fn main() void {
    var people = [_]Person{
        .{ .name = "alice", .age = 30 },
        .{ .name = "bob", .age = 25 },
    };
    std.mem.sort(Person, &people, {}, Person.byAge);
    std.debug.print("{s} {s}\n", .{ people[0].name, people[1].name });
}
