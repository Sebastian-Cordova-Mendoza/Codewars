

#Code done in March 2023

"""
Move the first letter of each word to the end of it, then add "ay" to the end of the word.
Leave punctuation marks untouched.


"""

import re

def pig_it(text):
    palabras = re.findall(r'''[\w']+|[.,!?;]''',text)
    nueva = []
    for i in range(len(palabras)):
        if bool(re.search(r'''[.,!?;]''',palabras[i])) == True:
            nueva.append(palabras[i])
        else:
            nueva.append(palabras[i][1:]+palabras[i][0] + "ay")

    resultado = ' '.join(nueva)

    return resultado