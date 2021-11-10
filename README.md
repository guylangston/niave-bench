# Niave C# Benchmarks
C# .NET Benchmarks with niave implementation (allowing developers easy intuition)

For comparison C-implementations are sometimes provided for a baseline.


> NOTE: Each benchmark is self-contained, and are designed to be run individually -- not as a batch/aggregate.

## primes-upto-niave-1c-nomem

Primes up to 15mil, using a niave, single thread/core no-memory implementation.

This benchmark realy just checks the CPU clock and basic integer + loop manipulations. The loop is very tight and 
the major branch will appear random to the CPU's branch predictor; thereby causing lots of miss-predictions will all
the resulting penalties. I assume this will punish deeper, modern CPUs.

Learnings:
- JIT comes very close to native C

[More](./primes-upto-niave-1c-nomem/readme.md)
