# 🚀 Kubernetes Web Server with Minikube

This project sets up an **NGINX** web server running in a **Kubernetes** cluster with **Minikube**. 
It includes a **ConfigMap** for custom HTML and an **Ingress** for friendly domain access.

## 📌 Project Structure

| File | Function |
|---------|--------|
| `deployment.yaml` | Creates the pods running NGINX |
| `configmap.yaml` | Defines the site's custom HTML |
| `service.yaml` | Exposes the web server within the cluster |
| `ingress.yaml` | Allows access to the site via a friendly domain |

---

## 📥 Installation

### 1️⃣ Install Minikube (if not already installed)

**Linux:**
```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```

**Mac (Homebrew):**
```bash
brew install minikube
```

**Windows (Chocolatey):**
```powershell
choco install minikube
```

Check the installation:
```bash
minikube version
```

### 2️⃣ Start Minikube
```bash
minikube start --driver=docker
```

Check the nodes:
```bash
kubectl get nodes
```

---

## 🔥 Deploying Components

### 1️⃣ Create ConfigMap for Custom HTML
```bash
kubectl apply -f configmap.yaml
```

### 2️⃣ Create Deployment for the Web Server
```bash
kubectl apply -f deployment.yaml
```

### 3️⃣ Create Service to Expose the Web Server
```bash
kubectl apply -f service.yaml
```

### 4️⃣ Enable and Create Ingress for Friendly Domain
```bash
minikube addons enable ingress
kubectl apply -f ingress.yaml
```

Add the domain to **/etc/hosts** (Linux/Mac) or **C:\Windows\System32\drivers\etc\hosts** (Windows):
```
<MINIKUBE_IP> mysite.local
```

Find the Minikube IP with:
```bash
minikube ip
```

Now, open in the browser:
```
http://mysite.local
```

---

## 🔄 Verification and Debugging

Check pods:
```bash
kubectl get pods
```

Check NGINX logs:
```bash
kubectl logs -l app=web
```

Access the container inside the pod:
```bash
kubectl exec -it $(kubectl get pod -l app=web -o jsonpath="{.items[0].metadata.name}") -- /bin/sh
```

Check services:
```bash
kubectl get svc
```

---

## 🗑️ Removing Resources
To delete everything:
```bash
kubectl delete deployment web-server
kubectl delete service web-service
kubectl delete ingress web-ingress
kubectl delete configmap nginx-config
minikube stop
```

---

## 🎯 Next Steps
- Add HTTPS with TLS on Ingress
- Deploy a real application (Node.js, Python, Go)
- Add a database (MySQL or PostgreSQL)
- Monitoring with Prometheus and Grafana

---

🚀 **Your web server is now running on Kubernetes with Minikube!** 🎉
