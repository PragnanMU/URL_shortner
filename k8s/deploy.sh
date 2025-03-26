#!/bin/bash

# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# Build the Docker image
echo "Building Docker image..."
cd "$PROJECT_ROOT"
docker build -t url-shortener:latest .

# Apply Kubernetes manifests
echo "Applying Kubernetes manifests..."
cd "$SCRIPT_DIR"
kubectl apply -f redis-configmap.yaml
kubectl apply -f redis-deployment.yaml
kubectl apply -f url-shortener-deployment.yaml

# Wait for deployments to be ready
echo "Waiting for deployments to be ready..."
kubectl wait --for=condition=available --timeout=300s deployment/redis
kubectl wait --for=condition=available --timeout=300s deployment/url-shortener

# Get the NodePort
NODE_PORT=$(kubectl get service url-shortener -o jsonpath='{.spec.ports[0].nodePort}')
echo "Application is deployed! Access it at http://localhost:$NODE_PORT" 