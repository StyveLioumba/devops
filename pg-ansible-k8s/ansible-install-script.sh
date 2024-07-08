#!/bin/bash
sudo apt update -qq -y
sudo apt install -y -qq python3-venv python3-pip vim >/dev/null
cd $HOME
mkdir ansible-project
cd ansible-project
python3 -m venv venv
source $HOME/ansible-project/venv/bin/activate
pip install ansible
source $HOME/ansible-project/venv/bin/activate

# Init kubeadm
IPADDR=$(curl ifconfig.me && echo "") ## master ip address
NODENAME=$(hostname -s)
POD_CIDR="192.168.0.0/16" ## pod network cidr

sudo kubeadm init --apiserver-advertise-address=$IPADDR  --apiserver-cert-extra-sans=$IPADDR  --pod-network-cidr=$POD_CIDR --node-name $NODENAME
kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml
## Remove kube

sudo kubeadm reset -f
sudo apt-get purge -y kubelet kubeadm kubectl kubernetes-cni kube*
sudo apt-get autoremove -y
sudo rm -rf ~/.kube

## kill 6443 port
sudo kill -9 $(sudo lsof -t -i:6443)
sudo kill -9 $(sudo lsof -t -i:2379)

