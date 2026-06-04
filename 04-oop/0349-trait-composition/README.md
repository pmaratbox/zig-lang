# 0349 — Trait Composition

Compose two capabilities (A printing "a", B printing "b") into one type and invoke both, printing `a b`. Zig favors composition, so `AB` embeds an `A` and a `B` field and forwards to each contributed method.

## Run

    zig run main.zig
