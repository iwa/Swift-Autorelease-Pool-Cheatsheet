# Autorelease Pool Cheatsheet

## Explanation

[Source](https://www.reddit.com/r/swift/comments/1ky39cy/autorelease_pool_ios_developing)

- An autorelease pool is a mechanism in Obj-C/Swift that temporarily holds objects that are marked for deferred release
- These objects are automatically released at the end of the pool's lifecycle
- It's part of memory management - especially relevant when working with frameworks that rely on Objective-C under the hood (Foundation, UIKit, etc...)
- It only works in Apple OSes (iOS, iPadOS, macOS)
- Example: when running a loop with lots of operation involving memory heavy tasks, memory will spike until the end of the loop. Using a `@autoreleasepool` block will force to clean up after each iteration instead, making loops way more manageable memory-wise
- Autorelease Pool is present on every runloop cycle, but not always for background tasks & Swift closures
- Common use cases:
    - Image processing in a loop
    - Test execution, to isolate memory inbetween tests
    - Large file parsing
    - Batch core data imports

## Benchmark

### Command used

```bash
cmdbench --iterations 10 --print-averages ./autorelease-pool-cheatsheet
```

### Results

- Without: `3.303014 MB`
```
Memory (bytes):
    Maximum: 3303014.4
    Maximum per process: 3303014.4
```

- With: `3.15392 MB`
```
Memory (bytes):
    Maximum: 3153920.0
    Maximum per process: 3153920.0
```