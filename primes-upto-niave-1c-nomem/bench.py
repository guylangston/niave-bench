import math

def find_primes(upto):
    found=1
    next=3
    lastPrime=2
    while next<upto:
        if is_prime(next):
            found+=1
            lastPrime = next
        next+=2
    print("Found:", found, ", LastPrime:", lastPrime)

def is_prime(num):
    max = int(math.sqrt(num))
    for ii in range(3, max, 2):
        if (num % ii == 0): return True
    return False

find_primes(16000000)
