#!/bin/bash

zrok_release_url="https://github.com/openziti/zrok/releases/download/v0.4.15/zrok_0.4.15_linux_amd64.tar.gz"
script_wsl="https://github.com/DamionGans/ubuntu-wsl2-systemd-script.git"
cd $HOME
current_dir=$(pwd)

echo "#############################################"
echo "####   ⏬  Installation packages   ⏬   ####"
echo "#############################################"
apt update -y


echo "#################################################"
echo "### ⏬ Download and installation openZiti ⏬ ###"
echo "#################################################"

# export EXTERNAL_DNS="mon_nouveau_dns.example.com" 
export ZITI_CTRL_ADVERTISED_PORT=8440
export ZITI_CTRL_EDGE_ADVERTISED_PORT=8441
export ZITI_ROUTER_PORT=8442
export ZITI_PWD=$(LC_ALL=C tr -dc _A-Z-a-z-0-9 < /dev/urandom | head -c32)

# Ces variables sont obligatoires pour ecouter notre zrok 
export ZROK_CTRL_PORT=80
export ZROK_ZITI_CTRL_WILDCARD="mon_nouveau_dns.example.com"
export ZROK_API_ENDPOINT=http://localhost:${ZROK_CTRL_PORT}
export ZROK_ADMIN_TOKEN=$(LC_ALL=C tr -dc _A-Z-a-z-0-9 < /dev/urandom | head -c32)    

source /dev/stdin <<< "$(wget -qO- https://get.openziti.io/ziti-cli-functions.sh)"; expressInstall 

createControllerSystemdFile
createRouterSystemdFile "${ZITI_ROUTER_NAME}"

sudo cp "${ZITI_HOME}/${ZITI_CTRL_NAME}.service" /etc/systemd/system/ziti-controller.service
sudo cp "${ZITI_HOME}/${ZITI_ROUTER_NAME}.service" /etc/systemd/system/ziti-router.service

sudo systemctl daemon-reload
sudo systemctl enable --now ziti-controller
sudo systemctl enable --now ziti-router

sudo systemctl -q status ziti-controller --lines=0 --no-pager
sudo systemctl -q status ziti-router --lines=0 --no-pager

source ~/.ziti/quickstart/$(hostname -s)/$(hostname -s).env

echo "#############################################"
echo "### ⏬ Download and installation zrok ⏬ ###"
echo "#############################################"

wget -q -c $zrok_release_url -O zrok.tar.gz 
tar vxfz zrok.tar.gz
chmod +x zrok
mv zrok /usr/local/bin
rm -rf zrok.tar.gz

zrok version

echo "# generate these admin tokens from a source of randomness"

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
zrok admin bootstrap $HOME/ctrl.yml 

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

echo "#############################################"
echo "####     All things are ready! Go 🚀    ####"
echo "#############################################"

tail -f /dev/null
