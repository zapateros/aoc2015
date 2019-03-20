import math
N = 29000000

def divisorGenerator(n, part):
    large_divisors = []
    for i in xrange(1, int(math.sqrt(n) + 1)):
        if n % i == 0:
            if part == 2:
                if n / i <=50:
                    yield i
            else:
                yield i
            if i*i != n:
                large_divisors.append(n / i)
    for divisor in reversed(large_divisors):
        if part == 2:
            if n / divisor <= 50:
                yield divisor
        else:
            yield divisor

# Part One
for i in range(1,1000000):
    y = 10 * sum(divisorGenerator(i, 1))
    if y >= N:
        print "Part One:" , i
        break

# Part Two
for i in range(1,1000000):
    y = 11 * sum(divisorGenerator(i, 2))
    if y >= N:
        print "Part Two:" , i
        break
