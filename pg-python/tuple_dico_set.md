# Tuple dico set

## Exo 0: facture.py

```Python
compta = [
{"date":"18 jan 2021","HT":43.50,"TTC":92.45,"acheteur":"IMB"},
{"date":"19 jan 2021","HT":42.80,"TTC":51.19,"acheteur":"Thales"},
{"date":"20 jan 2021","HT":42.10,"TTC":34.87,"acheteur":"Atos"},
{"date":"21 jan 2021","HT":37.58,"TTC":37.58,"acheteur":"Wordline"},
{"date":"21 jan 2021","HT":37.58,"TTC":37.58,"acheteur":"Wordline"}
]
# la facture 
for i in compta:
    print(f"{i['date']} : {i['HT']}€ HT : {i['TTC']}€ TTC  : {i['acheteur']}")

# ajout d'un element     
compta.append({"date":"22 jan 2021","HT":37.58,"TTC":47.58,"acheteur":"Macumba"})

# la nouvelle facture avec l'element ajouté
for i in compta:
    print(f"{i['date']} : {i['HT']}€ HT : {i['TTC']}€ TTC  : {i['acheteur']}")
   
# supression d'un element et modification d'un autre
compta[0]["acheteur"] = "IBM"
compta.remove({"date":"21 jan 2021","HT":37.58,"TTC":37.58,"acheteur":"Wordline"})

# la nouvelle facture avec l'element supprimé et l'element modifié
for i in compta:
    print(f"{i['date']} : {i['HT']}€ HT : {i['TTC']}€ TTC  : {i['acheteur']}")
```

## EXO 1: 

```Python
set_var= {"Pomme","Banane","Cerise"}
set_var.add("Poire")
print(set_var)

sampleSet = {"Yellow", "Orange", "Black"}
sampleList = ["Blue", "Green", "Red"]
sampleSet.update(sampleList)
print(sampleSet)

set1 = {10, 20, 30, 40, 50}
set2 = {30, 40, 50, 60, 70}
set3 = set1.intersection(set2)
print(set3)

set1 = {10,20,30,40,50}
set1.discard(10)
set1.discard(20)
set1.discard(30)
print(set1)
```

## EXO 2: 

```Python
dico = {"banane": 1.5, "pomme": 0.5, "dentifrice": 3,"eau": 1,"salade": 4}
basket = {"banane": 1, "pomme": 2, "dentifrice": 0,"eau": 1,"salade": 5}
basket2 = {"banane": 2, "pomme": 4, "dentifrice": 1,"eau": 5,"salade": 0}

somme = 0
for i in basket:
    somme += basket[i] * dico[i]
    
somme2 = 0
for i in basket2:
    somme2 += basket2[i] * dico[i]
    
print(f"Le prix du panier est de {somme}€")
print(f"Le prix du panier est de {somme2}€")
```