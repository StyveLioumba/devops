# Boucles

## Exo 0: range.py

```Python
chaine="blablabla"

## BOUCLE FOR (ONE)
r_one=list()
for one in range(21):
    r_one.append(one)

## BOUCLE WHILE
_one=0
while _one < 21:
    r_one.append(_one)
    _one+=1

print(f"r_one :  {r_one}")

## BOUCLE FOR (TWO)
r_two=[]
for two in range(5,31):
    r_two.append(two)

## BOUCLE WHILE
_two=5
while _two < 31:
    r_two.append(_two)
    _two+=1

print(f"r_two :  {r_two}")

## BOUCLE FOR (THREE)
r_three=list()
for three in range(10,22,2):
    r_three.append(three)

## BOUCLE WHILE
_three=10
while _three < 22:
    r_three.append(_two)
    _three+=2
  
print(f"r_three :  {r_three}")

## BOUCLE FOR (FOUR)
r_four=[]
for four in range(-20,2):
    r_four.append(four)
    
## BOUCLE WHILE
_four=-20
while _four < 2:
    r_three.append(_four)
    _four+=1

print(f"r_four :  {r_four}")

## BOUCLE FOR (FIVE)
r_five=list()
for five in range(len(chaine)):
    r_five.append(five)
    
## BOUCLE WHILE
_five=0
while _five < len(chaine):
    r_five.append(_five)
    _five+=1
    
print(f"r_five :  {r_five}")
```

## EXO 1: punition.py

```Python
## BOUCLE FOR
for i in range(1,101):
    print(f"{i}- Je dois apprendre python pour progresser en secu.")
    
## BOUCLE WHILE
j=1
while j < 101:
    print(f"{j}- Je dois apprendre python pour progresser en secu.")
    j+=1
```

## EXO 2: carre_ART.py

```Python
## BOUCLE FOR
cote= int(input("Entrez la taille du cote du carre : "))
for i in range(cote):
    print(f"{'#'*cote}")

## BOUCLE WHILE
k=0    
while k < cote:
    print(f"{'#'*cote}")
    k+=1
```

## EXO 3: carre_vide_ART.py

```Python
## BOUCLE FOR
cote= int(input("Entrez la taille du cote du carre : "))
for i in range(cote):
    if i == 0 or i == cote-1:
        print("#"*cote)
    else:
        print("#"+" "*(cote-2)+"#")

## BOUCLE WHILE
l=0
while l < cote:
    if l == 0 or l == cote-1:
        print("#"*cote)
    else:
        print("#"+" "*(cote-2)+"#")
    l+=1
```