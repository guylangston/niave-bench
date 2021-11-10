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

```bash

$ ./run.sh
  Model name:           Intel(R) Core(TM) i5-6300U CPU @ 2.40GHz

Project (1/4): bench-net31.csproj
[dotnet] $ dotnet run -c Release --project bench-net31.csproj
[NaiveSingleThreadPrimes] Found primes 1,031,130 up to 15,999,989
Complete: 00:00:05.4258580


Project (2/4): bench-net50.csproj
[dotnet] $ dotnet run -c Release --project bench-net50.csproj
[NaiveSingleThreadPrimes] Found primes 1,031,130 up to 15,999,989
Complete: 00:00:05.7019447


Project (3/4): bench-net60.csproj
[dotnet] $ dotnet run -c Release --project bench-net60.csproj
[NaiveSingleThreadPrimes] Found primes 1,031,130 up to 15,999,989
Complete: 00:00:05.3605250


Project (4/4): bench-net6-rtr.csproj
[dotnet] $ dotnet run -c Release --project bench-net6-rtr.csproj
[NaiveSingleThreadPrimes] Found primes 1,031,130 up to 15,999,989
Complete: 00:00:05.3898258


[MONO]
[NaiveSingleThreadPrimes] Found primes 1,031,130 up to 15,999,989
Complete: 00:00:08.1390051

[gcc]
[NaivePrimes] count=1031130 lastPrime=15999989
Complete in 4.669878 sec.

[clang]
[NaivePrimes] count=1031130 lastPrime=15999989
Complete in 4.710970 sec.
```
