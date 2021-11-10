using System;
using System.Diagnostics;
using System.Runtime.CompilerServices;

namespace bench
{
    class Program
    {
        static void Main(string[] args)
        {
            var timer = new Stopwatch();
            timer.Start();
            
            PrimeBench.Run(16_000_000);

            timer.Stop();
            Console.WriteLine($"Complete: {timer.Elapsed}");
        }
    }

    static class PrimeBench
    {
        public static void Run(int upTo)
        {
            var found = 1; // 2 is a prime
            var next = 3;
            var lastPrime = 2; 
            
            // While is would be more correct to set every 2nd to true, it is not nessesary and too slow
            var sieve = new bool[upTo];
            do
            {
                if (!sieve[next] && IsPrime(next))
                {
                    var fwd = next;
                    while(fwd < upTo)
                    {
                        sieve[fwd] = true;
                        fwd += next;
                    }
                    found++;
                    lastPrime = next;
                }
                next+=2;
            }
            while(next < upTo);
            Console.WriteLine($"[NaiveSingleThreadPrimes] Found primes {found:#,###} up to {lastPrime:#,###}");
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private static bool IsPrime(int num)
        {
            var max = (int)Math.Sqrt(num);
            for(var ii=3; ii<=max; ii+=2)
            {
                if (num % ii == 0) return false;
            }
            return true;
        }
    }
}
