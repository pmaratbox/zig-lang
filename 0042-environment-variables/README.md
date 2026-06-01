# 0042 — Environment Variables

Read the environment variable `LESSON_ENV_VAR`, falling back to `default` when it is unset, and print `value: default`. Zig 0.16 provides the environment through a `std.process.Init` parameter; `init.environ_map.get(name)` returns an optional, and `orelse` supplies the default. (`std.posix.getenv` was removed.)

## Run

    zig run main.zig
