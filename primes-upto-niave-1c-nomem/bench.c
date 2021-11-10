#include <stdio.h>
#include <math.h>
#include <time.h>

void find_primes(int findNum);
int is_prime(int num);

int main(int count, char *args[])
{
    clock_t start, end;

    start = clock();
    find_primes(16000000);
    end = clock();

    double sec = (double)(end-start) / (double)CLOCKS_PER_SEC;
    printf("Complete in %f sec.\n", sec);
    return 0;
}

void find_primes(int upTo)
{
    int found = 1;
    int next = 3;
    int lastPrime = 2;
    do
    {
        if (is_prime(next))
        {
            found++;
            lastPrime = next;
        }
        next+=2;
    }
    while(next < upTo);
    printf("[NaivePrimes] count=%0i lastPrime=%1i\n", found, lastPrime); 
}

int is_prime(int num)
{
    int max = sqrt((double)num);
    for(int ii=3; ii<=max; ii+=2)
    {
        if (num % ii == 0) return 0;
    }
    return 1;
}

