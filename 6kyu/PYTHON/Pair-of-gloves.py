

# Code done in June 2022

"""
Winter is coming, you must prepare your ski holidays. 
The objective of this kata is to determine the number of pair of gloves 
you can constitute from the gloves you have in your drawer.

Given an array describing the color of each glove, 
return the number of pairs you can constitute, 
assuming that only gloves of the same color can form pairs.

Examples:
input = ["red", "green", "red", "blue", "blue"]
result = 2 (1 red pair + 1 blue pair)

input = ["red", "red", "red", "red", "red", "red"]
result = 3 (3 red pairs)
"""


#My solution


def number_of_pairs(gloves):
    count = {}
    pares = 0
    x = 0
    for i in gloves:
        count[i] = gloves.count(i)
    res = {k: v for k, v in count.items() if (v%2==0 or v%3==0 or v%5==0)}
    for number in res:
        if res[number]%3==0:
            x = x + (res[number]/3)
        else:
            x = x + (res[number]/2)
    return int(x)



#other interesting solutions
def number_of_pairs(gloves):
    return sum(gloves.count(color)//2 for color in set(gloves))


from collections import Counter
def number_of_pairs(gloves):
    return sum(c // 2 for c in Counter(gloves).values())