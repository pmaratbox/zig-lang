# 0352 — ROT13

Apply ROT13 to "hello" (->"uryyb") and ROT13 again to recover "hello", printing `uryyb hello`. In Zig a small helper maps each byte with modular arithmetic over the alphabet.

## Run

    zig run main.zig
