# Fonctions

## Exo 0: 

```Python
def bonjour5():
    for _ in range(5):
        print("Bonjour")

bonjour5()
```

## Exo 1: renvoie_str.py

```Python
def renvoie_str(data):
    return str(data)

print(renvoie_str(5))
```

## Exo 2: renvoie_init.py

```Python
def renvoie_double(data):
    return data ** 2

print(renvoie_double(5))
```

## Exo 3: renvoie_bool.py

```Python
def renvoie_bool(data):
    return isinstance(data, int)

print(renvoie_bool(5))
```

## Exo 4: saisie_user.py

```Python
def saisie_user():
    value = input("Entrez une donnée alpha ou numerique : ")
    
    if value.isnumeric():
        print(f"C'est un chiffre")
    elif value.isalpha():
        if len(value) == 1:
            print(f"C'est une lettre")
        else:
            print(f"C'est une chaine de caractere")
    else:
        print(f"C'est autre chose")
       
        
saisie_user()

```

## Exo 5: saisie_user_evolution.py

```Python
def saisie_user_evolution():
    value = input("Entrez une donnée alpha ou numerique : ")
    data = list(value for value in value)
    
    nb_car=0
    nb_digit=0
    nb_other=0
    
    for value in data:
        if value.isnumeric():
            nb_digit += 1
        elif value.isalpha():
            nb_car += 1
        else:
            nb_other += 1
    
    print(f"Il y a {nb_car} lettres, {nb_digit} chiffres et {nb_other} signe de ponctuation")

saisie_user_evolution()
```

## Exo 6: check_password.py

```Python
def check_pwd():
    print("Verifier la force d'un mot de passe")
    choise= input("[C]hecker \n[Q]uitter \nVotre choix -> ")
    
    if choise[0].upper() == "Q":
        print("A bientot")
        exit()
    elif choise[0].upper() == "C":
        pwd= input("Entrez un mot de passe : ")
        if len(pwd) >= 12:
            print("Mot de passe correct est assez long")
        else:
            print("Mot de passe trop court")
            
         # checker si le mot de passe contient 2 caracteres speciaux
        spec_char= ["@", "#", "!", "?", "$", "%", "&", "*", "(", ")", "-", "_", "+", "=", "<", ">", "/", "|", ":", ";", "[", "]", "{", "}", "~"]
        if len([char for char in pwd if char in spec_char]) >= 2:
            print("Mot de passe est assez secu")
        else:
             print("Mot de passe n'est pas assez secu")
    else:
        print("Choix incorrect")
        check_pwd()
        


check_pwd()    
```