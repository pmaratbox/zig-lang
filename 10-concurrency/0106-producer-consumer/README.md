# 0106 — Producer / Consumer

A producer sends 1..5 to a consumer that sums them, printing `15`. A bounded ring buffer guarded by an atomic spinlock makes the producer spin when full and the consumer spin when empty.

## Run

    zig run main.zig
