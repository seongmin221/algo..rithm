n = int(input())
def sugarDeliver(n):
    smallBag = 0
    while(n % 5 != 0):
        n -= 3
        smallBag += 1
        if ( n < 0 ):
            return -1
    return smallBag + int(n / 5)

print(sugarDeliver(n))