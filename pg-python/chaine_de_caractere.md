# Chaine de caractere (String)

## 1. Visite des methodes les importantes

```Python
chaine="Avec python je progresse vite en programmation"
print("capital letter : " ,chaine.upper())
print("normal letter : ", chaine.lower())
tab=chaine.split(" ")
print("tab : ", tab)
print("-".join(tab))
print("_".join(tab))
print(chaine.replace(' ', '_'))  

```

## 2. Indice, slice, concatenation

```Python
chaine="python"
print(chaine)
print(f"{chaine[0]}")
print(f"{chaine[4]}")
```

## Exo 0:
    
```Python
chaine="abcdefghijklmnopqrstuvwxyz"
print(chaine[0:6])
print(chaine[chaine.index("m"):chaine.index("r")+1])
print(chaine[0:10])
print(chaine[-10:])
print(chaine[::2])
print(chaine[1::2])
print(chaine[1:chaine.find(i)+1:2])
print(chaine)
print(chaine[::-1])


tabcar = ['p','y','t','h','o','n',' ','e','s','t',' ','u','n',' ','s','u','p','e','r',' ','l','a','n','g','a','g','e']
chaine=""
for car in tabcar:
    chaine+=car

print(str(chaine))

import string
indices=[15,21,10,16,90,25,34,29,17,0,23,88,1,28,88,16,27,3,10,29,92]
chaine=""
for i in indices:
    chaine+=string.printable[i]
    
print(chaine)
        
```