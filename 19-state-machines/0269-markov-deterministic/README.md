# 0269 — Deterministic Transition Walk

Walk a deterministic transition map A->B->C->A for three steps from A, printing the visited states `B C A`. A Zig `enum` with a `switch` transition function expresses the deterministic next-state map.

## Run

    zig run main.zig
