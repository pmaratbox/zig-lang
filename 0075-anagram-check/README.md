# 0075 — Anagram Check

Check whether each pair is an anagram by comparing sorted letters — `listen`/`silent` and `hello`/`world` — printing `listen/silent: yes` and `hello/world: no`. Each word is copied into a scratch buffer and sorted with `std.mem.sort` + `std.sort.asc(u8)`; `std.mem.eql` compares the sorted bytes.

## Run

    zig run main.zig
