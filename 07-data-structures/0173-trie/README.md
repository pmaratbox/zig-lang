# 0173 — Trie

Insert "cat" and "car" into a trie, then search "car" (yes) and "can" (no), printing `yes no`. Each node carries a fixed `[26]?*TrieNode` child array and an `end` flag, with nodes allocated from an arena.

## Run

    zig run main.zig
