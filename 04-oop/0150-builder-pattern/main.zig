const std = @import("std");

const Pizza = struct {
    size: []const u8,
    topping: []const u8,

    fn print(self: Pizza) void {
        std.debug.print("Pizza({s}, {s})\n", .{ self.size, self.topping });
    }
};

const PizzaBuilder = struct {
    size: []const u8 = "",
    topping: []const u8 = "",

    fn setSize(self: PizzaBuilder, size: []const u8) PizzaBuilder {
        var b = self;
        b.size = size;
        return b;
    }

    fn addTopping(self: PizzaBuilder, topping: []const u8) PizzaBuilder {
        var b = self;
        b.topping = topping;
        return b;
    }

    fn build(self: PizzaBuilder) Pizza {
        return .{ .size = self.size, .topping = self.topping };
    }
};

pub fn main() void {
    const pizza = (PizzaBuilder{}).setSize("M").addTopping("cheese").build();
    pizza.print();
}
