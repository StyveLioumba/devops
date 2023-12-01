# Ouvrir un premier terminal

Créer un environnement virtuel : python3 -m venv venv
Lancer l'environnement :
- .\venv\bin\Activate.ps1 => PowerShell
- .\venv\bin\activate.bat => CMD
- venv/bin/activate => Bash

Installer le module requests : pip install requests
Installer les modules de Flask : pip install -r requirements.txt
NB : pip install flask_sqlachemy

Modifier le chemin de la base de données dans le fichier config.py :
- SQLALCHEMY_DATABASE_URI = "sqlite:///Users.db"

python3 app.py ==> Donnera l'adresse IP

# Dans un deuxième terminal

Lancer l'environnement :
- .\venv\bin\Activate.ps1 => PowerShell
- .\venv\bin\activate.bat => CMD
- venv/bin/activate => Bash

Lancer le fichier python du client : python3 <fichier.py>

## IMPORTANT

avant de telecharger une dependance il faut creer un environnement virtuel
```bash
python3 -m venv le_nom_de_mon_environnement

# pour activer l'environnement virtuel
source le_nom_de_mon_environnement/bin/activate

```