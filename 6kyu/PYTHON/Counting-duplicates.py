

# Code done in June 2022

"""
DESCRIPTION:
Count the number of Duplicates
Write a function that will return the count of distinct case-insensitive alphabetic 
characters and numeric digits that occur more than once in the input string. 
The input string can be assumed to contain only alphabets (both uppercase and lowercase)
and numeric digits.

Example
"abcde" -> 0 # no characters repeats more than once
"aabbcde" -> 2 # 'a' and 'b'
"aabBcde" -> 2 # 'a' occurs twice and 'b' twice (`b` and `B`)
"indivisibility" -> 1 # 'i' occurs six times
"Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice
"aA11" -> 2 # 'a' and '1'
"ABBA" -> 2 # 'A' and 'B' each occur twice

"""

# My solution

def duplicate_count(text):
    text = text.lower()
    a = []
    letras = []
    for i in text:
        if text.count(i) != 1:
            letras.append(i)
    return len(list(set(letras)))




# Other interesting solutions

def duplicate_count(s):
  return len([c for c in set(s.lower()) if s.lower().count(c)>1])



from collections import Counter
def duplicate_count(text):
    counter = Counter(text.lower())
    return len([counter.keys() for i in counter.values() if i>1])