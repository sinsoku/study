# Swift

## Basic Usage

Running `bin/run` with no arguments will run `swift`:

```
$ bin/run
Welcome to Swift version 3.0-dev (LLVM 8fcf602916, Clang cf0a734990, Swift 000d413a62). Type :help for assistance.
  1>
```

Alternatively you can pass bin/run arguments:

```
$ bin/run swift sample/hello.swift
Hello, World!
```

## Create a package

```
$ mkdir sample
$ bin/run swift package init -C sample
```

## Build a package

```
$ bin/run swift build -C sample
```

## Test a package

```
$ bin/run swift test -C sample
```
