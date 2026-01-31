#!/bin/bash

# Script to install Argo CD via Helm and start port-forwarding

set -euo pipefail

# Variables
NAMESPACE="argocd"
HELM_REPO_NAME="argo"
HELM_REPO_URL="https://argoproj.github.io/argo-helm"
RELEASE_NAME="argocd"
PORT_FORWARD_LOCAL=8080
PORT_FORWARD_REMOTE=443
ARGOCD_SERVER_NAME="argocd-server"


echo "=== Adding Helm repo ==="
helm repo add $HELM_REPO_NAME $HELM_REPO_URL

echo "=== Updating Helm repos ==="
helm repo update

echo "=== Creating namespace: $NAMESPACE ==="
kubectl create namespace $NAMESPACE || echo "Namespace $NAMESPACE already exists"

echo "=== Installing Argo CD via Helm ==="
helm install $RELEASE_NAME $HELM_REPO_NAME/argo-cd -n $NAMESPACE

echo "=== Starting port-forward to Argo CD server ==="
kubectl port-forward svc/${ARGOCD_SERVER_NAME=}-server -n $NAMESPACE ${PORT_FORWARD_LOCAL}:${PORT_FORWARD_REMOTE} --address=0.0.0.0 &
PORT_FORWARD_PID=$!

echo "Port-forward started in background with PID $PORT_FORWARD_PID"
echo "Access Argo CD at: http://localhost:$PORT_FORWARD_LOCAL"

