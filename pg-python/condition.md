# Conditions

## Exo 0: plus_moins.py

```Python
nb_a=5
nb_b=23

if nb_a > 3:
    print("nb_a est plus grand que 3")
else:
    print("nb_a est plus petit que 3")
 
if (nb_b - nb_a) > 10:
    print("nb_b est superieur à 10")
else:
    print("nb_b est inferieur à 10")
```

## EXO 1: car_in_chaine.py

```Python
chaine= "chaine de caracteres"
a= "a"
x= "x"
u= "u"

if a in chaine:
    print("\"a\" est dans la chaine")
else:
    print("\"a\" n'est pas dans la chaine")
    
if x in chaine:
    print("\"x\" est dans la chaine")
else:
    print("\"x\" n'est pas dans la chaine")

if u in chaine:
    print("\"u\" est dans la chaine")
else:
    print("\"u\" n'est pas dans la chaine")
    
```

## EXO 2: authent_step_1.py

```Python
login= input("Entrez votre login : ")
password= input("Entrez votre mot de passe : ")

if login == "admin" and password == "changeme" and len(password) >= 8:
    print("Le mot de passe est correct, taille {}.\n✅Authentification reussie!".format(len(password)))
else:
    print("Le login incorrect ou mot de passe trop petit.\n🛑Authentification echouee!")
```