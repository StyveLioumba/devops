#!/bin/bash
# recupere le nom de la machine , du system et du shell utilisé
echo "Machine name : $(hostname)"
echo "System : $(uname -o)"
echo "Shell : $(basename $SHELL)"

## Installer des paquets
apt install psutil -y -q

## Afficher les informations sur le CPU , la RAM et le disque dur, le nombre de processus en cours d'exécution, le reseau
#echo "${top -bn1 | grep load}"
#echo "$(free -m | grep Mem)"
#echo "$(df -h | grep /dev/sda1)"
#echo "$(ps aux | wc -l)"

## Afficher les utilisateurs presents sur la machine
#echo "$(cut -d: -f1 /etc/passwd)"

## Afficher les informations sur l'utilisateur souhaite
#echo "User : $(whoami)"

## Creer un utilisateur
#sudo useradd -m -s /bin/bash newUser -p password -d /home/newUser

## Changer de mot de passe automatiquement avec le nouveau mot de passe
#echo "newUser:password" | sudo chpasswd

## Supprimer un utilisateur
#sudo userdel -fr newUser

## creer une cli
case $1 in
"1")
  echo "CPU : ${top -bn1 | grep load}"
  echo "RAM : $(free -m | grep Mem)"
  echo "Disque dure : $(df -h | grep /dev/sda1)"
  echo "Reseau : $(ps aux | wc -l)";;
"2")echo "les Utilisateurs: $(cut -d: -f1 /etc/passwd)";;
"3")echo "Bienvenue : $(cut -d: -f1 /etc/passwd | grep $2)";;
"4")
  useradd -m -s /bin/bash $2 -p password -d /home/$2
  echo "Vous avez crée l'utilisateur : $(cut -d: -f1 /etc/passwd | grep $2)";;

"5")sudo userdel -fr $2;;
"6")echo "$2:$3" | sudo chpasswd;;
"7")exit;;
*)echo "Choisir une option valide";;
esac
