

# Code done in June 2022


"""
Return the number (count) of vowels in the given string.

We will consider a, e, i, o, u as vowels for this Kata (but not y).

The input string will only consist of lower case letters and/or spaces.
"""


#My solution

def get_count(sentence):
    count = 0
    for i in sentence:
        if i in ('a','e','i','o','u'):
            count = count + 1
        else:
            pass
    return (count)