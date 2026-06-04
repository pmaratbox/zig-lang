# 0346 — Newtype Wrapper

Wrap raw integers in distinct UserId and ProductId types so they cannot be confused, printing `user-1 prod-2`. Zig single-field structs are nominal, so the two wrappers are incompatible types.

## Run

    zig run main.zig
