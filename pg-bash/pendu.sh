#!/bin/bash

echo "LE JEU DU PENDU ! ☠️"

wordTab=("Froid" "Pain" "Argent" "Panier" "Voiture" "Musique" "Repas")
nbTry=2
indice=1

min=0
max=$((${#wordTab[@]} - 1))

index=$(($RANDOM % ($max - $min + 1) + $min))

word=${wordTab[$index]}

rightLetters=()

function askWord() {
  rightLetters=()

  echo "Essai ${indice} sur ${nbTry}"

  read -p "Entrez un mot à ${#word} lettres : " response

  # Verification si le mot est le bon
  if [[ $response == $word ]]; then
    echo "Bravo 🎉🎊 ! Vous avez trouvé le mot !"
    exit 0
  fi

  # Verification de la taille du mot
  if [[ ${#response} -ne ${#word} ]]; then
    echo "Le mot doit faire ${#word} lettres pas plus pas moins !"
    askWord
  fi

  # Verification si le mot est dans le tableau
  splitResponse=($(echo $response | grep -o .))
  splitWord=($(echo $word | grep -o .))

  for ((i = 0; i < ${#splitResponse[*]}; i++)); do
    if [[ ${splitWord[*]} =~ ${splitResponse[$i]} ]]; then
      echo "La lettre ${splitResponse[$i]} est dans le mot !"
      rightLetters+=(${splitResponse[$i]})
    fi
  done

  # Verification si aucune lettre n'est dans le mot
  if [[ ${#rightLetters[*]} -eq 0 ]]; then
    echo "Aucune lettre n'est dans le mot !"
  else
    echo "Vous avez trouvé ${#rightLetters[*]} lettre(s) !"
  fi

  # Verification si le nombre d'essai est atteint
  if [[ $indice -eq $nbTry ]]; then
    echo "Vous avez atteint le nombre d'essai !"
    echo "Vous avez perdu ! Le mot était ${word} !"
    exit 0
  fi

  ((indice++))
  askWord

}

askWord
