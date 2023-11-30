# Listes

## EXO 0: indice_list.py

```Python
tab = ["pain","orange","eau","fruit","legume"]

for i in tab:
    print(f"indice : {tab.index(i)} -> {i}")
```

## EXO 1: elts_tab.py

```Python
tab = ["pain","orange","eau","fruit","legume"]

for value in enumerate(tab):
    print(f"indice : {value[0]} -> {value[1]}")
```

## EXO 2: tab_enumerate.py

```Python
tab = ["pain","orange","eau","fruit","legume"]
print(list(enumerate(tab)))
```

## EXO 3: append_list.py

```Python
tab_a=[15,20,5,14,1,0,19,26,4,6,5]
tab_b=[3,26,18,3,7,6,9,20,8,1,23]
tab_c=[]

for i in range(len(tab_a)):
    if tab_a[i] > tab_b[i]:
        tab_c.append(tab_a[i])
    
    if tab_b[i] > tab_a[i]:
        tab_c.append(tab_b[i])

print(tab_c)
```

## EXO 4: compter_les_doublons.py

```Python
serie_a=[1,5,1,6,8,4,9,5,6,1,1,4,7,6,2,5,6,0,0,7,8,5,6,1,2]
print(serie_a)
# trie la liste
print(sorted(serie_a))
serie_a.sort()
print(serie_a)

# compte les doublons
print(f"0 apparait : {serie_a.count(0)} fois")
print(f"1 apparait : {serie_a.count(1)} fois")
```