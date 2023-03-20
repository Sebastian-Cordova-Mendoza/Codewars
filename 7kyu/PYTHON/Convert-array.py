

# Code done in June 2022

"""
Create the function that takes as a parameter a sequence of numbers 
represented as strings and outputs a sequence of numbers.

ie:["1", "2", "3"] to [1, 2, 3]
"""


#My solution

def to_float_array(arr): 
    arr = list(map(float, arr))
    return arr