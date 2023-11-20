# Configuration ZROK

## Les etapes

1. Installer un certificat SSL [Suive ce lien](https://eff-certbot.readthedocs.io/en/stable/install.html) ensuite [Ce lien pour ](https://certbot.eff.org/instructions)

NB :  Il faut deja avoir un DNS validate 

2. Installer OpenZiti [en suivant ce lien](https://openziti.io/docs/learn/quickstarts/network/hosted/)
3. Installer Zrok [](https://docs.zrok.io/docs/guides/self-hosting/self_hosting_guide/)
    

## References et ressources
1. [Tutoriel youtube de 14 min ](https://youtu.be/pukLdf26YqY?feature=shared)

### ETAPE 1 : Installation du certificat 

```bash
# 1. Installer snapd
sudo apt update
sudo apt install snapd -y -q

# Pour tester votre système, installez le snap hello-world et assurez-vous qu'il fonctionne correctement :
sudo snap install hello-world
# response: hello-world 6.4 from Canonical✓ installed
hello-world
# response : Hello World!

# 2. Supprimez certbot-auto et tous les packages du système d'exploitation Certbot
sudo apt-get remove certbot
# OU
sudo dnf remove certbot
# OU
sudo yum remove certbot.


# 3. Installer Certbot
sudo snap install --classic certbot

# 4. Préparez la commande Certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot


# 5. Choisissez comment vous souhaitez exécuter Certbot
# Soit récupérez et installez vos certificats.
#Exécutez cette commande pour obtenir un certificat et demander à Certbot de modifier automatiquement votre configuration nginx pour la servir, en activant l'accès HTTPS en une seule étape.

sudo certbot --nginx

# Ou obtenez simplement un certificat Si vous vous sentez plus conservateur et souhaitez apporter manuellement les modifications à votre configuration nginx, exécutez cette commande.

sudo certbot certonly --nginx

# 6. Tester le renouvellement automatique
sudo certbot renouveler --dry-run
```

### ETATPE 2: Installer et configurer Openziti

```bash
# exporter l'ensemble des variables ci-dessous (si vous ne renseigner pas ces variables elles prendront des valeurs par defaut)
export EXTERNAL_DNS="mon_nouveau_dns.example.com" 
export ZITI_CTRL_ADVERTISED_PORT=8440 # par defaut = 6262
export ZITI_CTRL_EDGE_ADVERTISED_PORT=8441  # par defaut = 1280
export ZITI_ROUTER_PORT=8442 # par defaut = 3022


# Ces variables sont obligatoires pour ecouter notre zrok 
export ZROK_CTRL_PORT=80
export ZROK_ZITI_CTRL_WILDCARD="mon_nouveau_dns.example.com"
export ZROK_API_ENDPOINT=http://localhost:${ZROK_CTRL_PORT}
export ZROK_ADMIN_TOKEN=$(LC_ALL=C tr -dc _A-Z-a-z-0-9 < /dev/urandom | head -c32)



# Cette commande va executer le script et installer les certificats et toute la config
source /dev/stdin <<< "$(wget -qO- https://get.openziti.io/ziti-cli-functions.sh)"; expressInstall

# La suite de commande permet de rajouter ziti router et controller en tant que service dans le systemd
createControllerSystemdFile
createRouterSystemdFile "${ZITI_ROUTER_NAME}"

sudo cp "${ZITI_HOME}/${ZITI_CTRL_NAME}.service" /etc/systemd/system/ziti-controller.service
sudo cp "${ZITI_HOME}/${ZITI_ROUTER_NAME}.service" /etc/systemd/system/ziti-router.service

sudo systemctl daemon-reload

sudo systemctl enable --now ziti-controller
sudo systemctl enable --now ziti-router

sudo systemctl -q status ziti-controller --lines=0 --no-pager
sudo systemctl -q status ziti-router --lines=0 --no-pager

# cette commande permet d'executer la cmd ziti partout
source ~/.ziti/quickstart/$(hostname -s)/$(hostname -s).env

# Copie le certificat let's encrypt
sudo cat /etc/letsencrypt/live/${ZROK_ZITI_CTRL_WILDCARD}/fullchain.pem >> $HOME/.ziti/quickstart/vm-kcloud-dev-01/pki/cas.pem
sudo echo  cat /etc/letsencrypt/live/${ZROK_ZITI_CTRL_WILDCARD}/fullchain.pem >> $HOME/.ziti/quickstart/vm-kcloud-dev-01/pki/cas.pem
sudo echo  cat /etc/letsencrypt/live/${ZROK_ZITI_CTRL_WILDCARD}/fullchain.pem 
sudo systemctl restart ziti-controller
```

### ETAPE 3 : Installation et configuration de zrok

```bash	
zrok_release_url="https://github.com/openziti/zrok/releases/download/v0.4.15/zrok_0.4.15_linux_amd64.tar.gz"

wget -q -c $zrok_release_url -O zrok.tar.gz  # telecharger la release
tar vxfz zrok.tar.gz # decompresser
chmod +x zrok # ajouter les droits d'execution
mv zrok /usr/local/bin # ajouter zrok dans le dossier bin pour etre executer partout
rm -rf zrok.tar.gz # suppression de la release compresser

zrok version

# le fichier de conf du controleur zrok 
cat > ctrl.yml <<EOF
#    _____ __ ___ | | __
#   |_  / '__/ _ \| |/ /
#    / /| | | (_) |   <
#   /___|_|  \___/|_|\_\
# controller configuration

v:                  3

admin:
  # generate these admin tokens from a source of randomness, e.g. 
  #  LC_ALL=C tr -dc _A-Z-a-z-0-9 < /dev/urandom | head -c32
  secrets:
    -               $ZROK_ADMIN_TOKEN  # be sure to change this!

endpoint:
  host:             0.0.0.0
  port:             $ZROK_CTRL_PORT

invites:
  invites_open:    true

store:
  path:             zrok.db
  type:             sqlite3

ziti:
  api_endpoint:     "https://${ZITI_CTRL_EDGE_ADVERTISED_ADDRESS}:${ZITI_CTRL_EDGE_ADVERTISED_PORT}" # ZITI_EDGE_CTRL_ADVERTISED_HOST_PORT = machinename:1280
  username:         $ZITI_USER
  password:         $ZITI_PWD

EOF

zrok admin bootstrap ctrl.yml # execution du fichier , il va generer un id 

export ZROK_FRONTEND_TOKEN="l'id generer"

ziti edge login ${ZITI_CTRL_EDGE_ADVERTISED_ADDRESS}:${ZITI_CTRL_EDGE_ADVERTISED_PORT} -u ${ZITI_USER} -p ${ZITI_PWD} -y

ziti edge list identities

sudo tee /etc/systemd/system/zrok-controller.service > /dev/null <<EOF
[Unit]
Description=Zrok-Controller
After=network.target

[Service]
User=root
WorkingDirectory=$HOME
ExecStart=zrok controller "$HOME/ctrl.yml"
Restart=always
RestartSec=2
LimitNOFILE=65535

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable --now zrok-controller

zrok admin list frontends
zrok admin create frontend ${ZROK_FRONTEND_TOKEN} public https://{token}.${ZROK_ZITI_CTRL_WILDCARD}

cat > http-frontend.yml <<EOF
v:                  3
host_match:         ${ZROK_ZITI_CTRL_WILDCARD}
address:            0.0.0.0:${ZROK_FRONTEND_PORT}
EOF

sudo tee /etc/systemd/system/zrok-frontend.service > /dev/null <<EOF
[Unit]
Description=Zrok-frontend
After=network.target

[Service]
User=root
WorkingDirectory=$HOME
ExecStart=zrok access public "$HOME/http-frontend.yml"
Restart=always
RestartSec=2
LimitNOFILE=65535

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable --now zrok-frontend

zrok invite
journalctl -fu zrok-controller

```