# Trivial 1-million primes

This is a trivial benchmark, which finds the first 1-million prime numbers. It uses a trivial (easy to understand), 
low-memory, single-threaded, imperitive algorythm that lends itself to implementation in multiple languages.

### Characteristics:
- Single-Threaded
- Effectively no memory usage (realistically almost no heap/stack allocation)
- Lightly optimised
- Zero dependancies
- Easy algorythm, any dev will have an intuition of the internals

### What it is NOT:
- Well Optimised (either via code, or via maths) 
- Prime Sieve
- Micro-benchmark (a la Benchmark.NET)

### What does is this benchmark highlight:

As the implementation is a few loops, integer division and only relies on `sqrt` stdlib code; 
the benchmark tests gives an compartive idea of general purpose single-core instruction pipeline speed.

## Language / Platform Tests
- .NET Core 3.1
- .NET 5.0
- .NET 6.0
- Mono
- C


