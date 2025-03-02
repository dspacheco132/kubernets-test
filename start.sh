#!/bin/bash -l

# Carregar o ambiente do bash corretamente
source /etc/profile
source ~/.bashrc

# Verificar se o kubectl está no PATH
which kubectl
if ! command -v kubectl &> /dev/null; then
    echo "kubectl não encontrado no PATH. Verifique a instalação."
    exit 1
fi

MINIKUBE_IP=$(minikube ip)

# Inicia o minikube caso não tenha sido iniciado
minikube start

kubectl get nodes 2> ./logs/erro.log
sleep 2

kubectl apply -f deployment.yaml 2>> ./logs/erro.log
kubectl get pods 2>> ./logs/erro.log
sleep 2

kubectl apply -f service.yaml 2>> ./logs/erro.log
kubectl apply -f configmap.yaml 2>> ./logs/erro.log

kubectl get svc 2>> ./logs/erro.log

echo "IP Minikube: $MINIKUBE_IP"
