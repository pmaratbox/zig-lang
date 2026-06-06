# 0403 — Subscribe and Unsubscribe

Return a Subscription from subscribe() and use it to unsubscribe so later values are not delivered. In Zig the Subscription is a struct whose `unsubscribe` sets a `closed` flag the source checks before each push.

## Run

    zig run main.zig 2>&1
