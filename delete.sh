#!/bin/bash

kubectl logs -l app=web >> ./logs/web.log      # Save the logs

# Delete the minikube resources
kubectl delete deployment web-server    # Delete the deployment
kubectl delete service web-service      # Delete the service
minikube stop                           # Stop the minikube
