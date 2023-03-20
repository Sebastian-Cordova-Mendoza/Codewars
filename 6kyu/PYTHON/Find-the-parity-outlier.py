

# Code done in June 2022

"""

You are given an array (which will have a length of at least 3, but could be very large) 
containing integers. The array is either entirely comprised of odd integers or entirely 
comprised of even integers except for a single integer N. 
Write a method that takes the array as an argument and returns this "outlier" N.

Examples
[2, 4, 0, 100, 4, 11, 2602, 36]
Should return: 11 (the only odd number)

[160, 3, 1719, 19, 11, 13, -21]
Should return: 160 (the only even number)

"""


#My solution
def find_outlier(integers):
    par = 0
    par_numeros = []
    impar = 0
    impar_numeros = []
    for i in range(len(integers)):
        if integers[i]%2==0:
            par = par + 1
            par_numeros.append(integers[i])
        else:
            impar = impar + 1
            impar_numeros.append(integers[i])
            
    if par == 1:
        return par_numeros[0]
    else:
        return impar_numeros[0]


#Other interesting solutions

def find_outlier(int):
    odds = [x for x in int if x%2!=0]
    evens= [x for x in int if x%2==0]
    return odds[0] if len(odds)<len(evens) else evens[0]


def find_outlier(integers):
    parity = [n % 2 for n in integers]
    return integers[parity.index(1)] if sum(parity) == 1 else integers[parity.index(0)]
