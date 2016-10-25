# Elixir

## Basic Usage

Running `bin/run` with no arguments will run `iex`:

```
$ bin/run
Erlang/OTP 19 [erts-8.1] [source] [64-bit] [smp:2:2] [async-threads:10] [hipe] [kernel-poll:false]

Interactive Elixir (1.3.4) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)>
```

Alternatively you can pass `bin/run` arguments:

```elixir
$ bin/run elixir sample/hello.exs
Hello, World!
```
