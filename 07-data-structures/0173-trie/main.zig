const std = @import("std");

const TrieNode = struct {
    children: [26]?*TrieNode = [_]?*TrieNode{null} ** 26,
    end: bool = false,
};

fn insert(root: *TrieNode, alloc: std.mem.Allocator, word: []const u8) !void {
    var node = root;
    for (word) |ch| {
        const i = ch - 'a';
        if (node.children[i] == null) {
            const child = try alloc.create(TrieNode);
            child.* = .{};
            node.children[i] = child;
        }
        node = node.children[i].?;
    }
    node.end = true;
}

fn search(root: *TrieNode, word: []const u8) bool {
    var node = root;
    for (word) |ch| {
        const i = ch - 'a';
        if (node.children[i] == null) return false;
        node = node.children[i].?;
    }
    return node.end;
}

pub fn main() !void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const alloc = arena.allocator();

    var root = TrieNode{};
    try insert(&root, alloc, "cat");
    try insert(&root, alloc, "car");

    std.debug.print("{s} {s}\n", .{
        if (search(&root, "car")) "yes" else "no",
        if (search(&root, "can")) "yes" else "no",
    });
}
