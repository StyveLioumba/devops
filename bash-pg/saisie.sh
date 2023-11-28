#!/bin/bash
echo "SAISIE  DE NOTE 🖥️"

echo "Nom!Prenom!Math!Anglais!OMGL!AP2" > $1.csv

function finDeProgramm() {
  echo "Fin du programme"
  exit 0
}

function askInfoStudent() {

    echo "pour quitter le programme, tapez le mot 'fin'"

    read -p "Nom: " nom
       if [ $nom = "fin" ]
       then
         finDeProgramm
       fi
    read -p "Prenom: " prenom
       if [ $prenom = "fin" ]
        then
         finDeProgramm
        fi
    read -p "Note en Maths: " maths
       if [ $maths = "fin" ]
        then
         finDeProgramm
        fi
    read -p "Note en Anglais: " anglais
       if [ $anglais = "fin" ]
        then
         finDeProgramm
        fi
    read -p "Note en OMGL: " omgl
       if [ $omgl = "fin" ]
        then
         finDeProgramm
        fi
    read -p "Note en AP2: " ap2
       if [ $ap2 = "fin" ]
        then
         finDeProgramm
        fi

    echo "$nom!$prenom!$maths!$anglais!$omgl!$ap2" >> $1.csv

    while [ true ]; do
        askInfoStudent $1
    done
}

askInfoStudent $1
