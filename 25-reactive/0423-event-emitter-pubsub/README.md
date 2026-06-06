# 0423 — EventEmitter (Pub/Sub)

Build a multi-topic EventEmitter with on(topic, handler), emit(topic, payload), and off(topic, handler). Zig uses a StringHashMapUnmanaged of ArrayListUnmanaged handlers, comparing function pointers to remove on off.

## Run

    zig run main.zig
