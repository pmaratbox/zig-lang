# 0284 — Trie Autocomplete

Insert "car","card","dog" into a trie and autocomplete the prefix "car", printing `car card`. Zig allocates trie nodes from an ArenaAllocator and DFS-collects matches.

## Run

    zig run main.zig
