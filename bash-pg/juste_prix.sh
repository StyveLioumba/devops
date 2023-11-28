#!/bin/bash

echo "LE JEU DU JUSTE PRIX !"

min=100
max=1000
price=$(($RANDOM % ($max-$min+1)+$min))
nbTry=0

function askPrice() {
    read -p "Entrez un prix entre $min et $max : " response

    nbTry=$(($nbTry+1))

    while [ $response -ne $price ]; do

        if [ $response -lt $price ]; then
            echo "C'est plus !"
        else
            echo "C'est moins !"
        fi
        askPrice
    done

    echo "Bravo ! Vous avez trouvé le juste prix en $nbTry coups !"
    exit 0;
}

askPrice

