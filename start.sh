#!/bin/bash -l

# Carregar o ambiente do bash corretamente
source /etc/profile
source ~/.bashrc

. ./var.sh

# Verificar se o kubectl está no PATH
which kubectl
if ! command -v kubectl &> /dev/null; then
    echo "kubectl não encontrado no PATH. Verifique a instalação."
    exit 1
fi

MINIKUBE_IP=$(minikube ip)

echo -e "${RED}##################################################${NC}"
echo -e "${RED}................Minikube - Start..................${NC}"
echo -e "${RED}##################################################${NC}"

minikube start
echo -e "${RED}##################################################${NC}"
kubectl get nodes 2> ./logs/erro.log
sleep 2
echo -e "${RED}##################################################${NC}"
kubectl apply -f deployment.yaml 2>> ./logs/erro.log
echo -e "${RED}##################################################${NC}"
kubectl get pods 2>> ./logs/erro.log
sleep 2
echo -e "${RED}##################################################${NC}"
echo "Apply service.yaml and configmap.yaml"
echo -e "${RED}##################################################${NC}"
kubectl apply -f service.yaml 2>> ./logs/erro.log
kubectl apply -f configmap.yaml 2>> ./logs/erro.log

echo -e "${RED}##################################################${NC}"
kubectl get svc 2>> ./logs/erro.log
sleep 2

echo -e "${RED}##################################################${NC}"
echo "IP Minikube: $MINIKUBE_IP"
