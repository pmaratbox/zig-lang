# 0350 — Static Factory Method

Use a static factory Color.fromHex("#ff0000") to build a color and print its components `255 0 0`. A namespaced `Color.fromHex` function parses the hex pairs with `std.fmt.parseInt` and returns a struct.

## Run

    zig run main.zig
