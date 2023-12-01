import paramiko
import argparse


parser = argparse.ArgumentParser()
parser.add_argument("host", help="host to connect", default="localhost")
parser.add_argument("user", help="user to connect")
parser.add_argument("password", help="password to connect")
parser.add_argument("port", help="port to connect" ,default=22)
args = parser.parse_args()


# effectuer une connexion SSH
ssh_client = paramiko.SSHClient()
ssh_client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
ssh_client.connect(hostname=args.host, username=args.user, password=args.password, port=args.port)



# effectuer une commande
ssh_client.exec_command("chmod u+x /opt/script_py.sh")

print("Bienvenue dans ma cli")
print("1 - Afficher les informations sur le CPU , la RAM et le disque dur, le nombre de processus en cours d'exécution, le reseau")
print("2 - Afficher les utilisateurs presents sur la machine")
print("3 - Afficher les informations sur l'utilisateur souhaite")
print("4 - Creer un utilisateur")
print("5 - Supprimer un utilisateur")
print("6 - Changer de mot de passe d'un utilisateur")
print("7 - Quitter")

choix = input("Que voulez vous faire ? ")
match choix:
    case "1":
        stdin, stdout, stderr = ssh_client.exec_command("bash /opt/script_py.sh 1")
        print(stdout.read().decode())
    case "2":
        stdin, stdout, stderr = ssh_client.exec_command("bash /opt/script_py.sh 2")
        print(stdout.read().decode())
    case "3":
        user = input("Quel utilisateur voulez vous afficher ? ")
        stdin, stdout, stderr = ssh_client.exec_command("bash /opt/script_py.sh 3 "+ user)
        print(stdout.read().decode())
    case "4":
        user = input("Quel utilisateur voulez vous creer ? ")
        stdin, stdout, stderr = ssh_client.exec_command("bash /opt/script_py.sh 4"+ user)
        print(stdout.read().decode())
    case "5":
        user = input("Quel utilisateur voulez vous supprimer ? ")
        stdin, stdout, stderr = ssh_client.exec_command("bash /opt/script_py.sh 5 "+ user)
        print(stdout.read().decode())
    case "6":
        user = input("Quel utilisateur voulez vous modifier ? ")
        password = input("Quel mot de passe voulez vous mettre ? ")
        stdin, stdout, stderr = ssh_client.exec_command("bash /opt/script_py.sh 5"+ user +password)
        print(stdout.read().decode())
    case "7":
        print("Au revoir")
        ssh_client.close()
        exit()

# copier un fichier vers le serveur
# action = ssh_client.open_sftp()
# action.put("script.sh", "/opt/script_py.sh")
# action.close()




# fermer la connexion
ssh_client.close()
