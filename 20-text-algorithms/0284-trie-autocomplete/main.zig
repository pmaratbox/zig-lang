const std = @import("std");

const Node = struct {
    children: [26]?*Node = [_]?*Node{null} ** 26,
    is_word: bool = false,
};

fn insert(alloc: std.mem.Allocator, root: *Node, word: []const u8) !void {
    var cur = root;
    for (word) |ch| {
        const idx = ch - 'a';
        if (cur.children[idx] == null) {
            const n = try alloc.create(Node);
            n.* = .{};
            cur.children[idx] = n;
        }
        cur = cur.children[idx].?;
    }
    cur.is_word = true;
}

fn collect(node: *Node, prefix: []u8, len: usize, first: *bool) void {
    if (node.is_word) {
        if (!first.*) std.debug.print(" ", .{});
        std.debug.print("{s}", .{prefix[0..len]});
        first.* = false;
    }
    var i: usize = 0;
    while (i < 26) : (i += 1) {
        if (node.children[i]) |child| {
            prefix[len] = @intCast('a' + i);
            collect(child, prefix, len + 1, first);
        }
    }
}

pub fn main() !void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const alloc = arena.allocator();

    var root = Node{};
    try insert(alloc, &root, "car");
    try insert(alloc, &root, "card");
    try insert(alloc, &root, "dog");

    const prefix = "car";
    var cur = &root;
    for (prefix) |ch| {
        cur = cur.children[ch - 'a'].?;
    }

    var buf: [64]u8 = undefined;
    std.mem.copyForwards(u8, buf[0..prefix.len], prefix);
    var first = true;
    collect(cur, buf[0..], prefix.len, &first);
    std.debug.print("\n", .{});
}
