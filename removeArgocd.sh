#!/bin/bash

# Script to uninstall Argo CD and clean up resources

set -euo pipefail

# Variables
NAMESPACE="argocd"
HELM_REPO_NAME="argo"
RELEASE_NAME="argocd"

echo "=== Uninstalling Argo CD Helm release ==="
if helm ls -n $NAMESPACE | grep -q $RELEASE_NAME; then
    helm uninstall $RELEASE_NAME -n $NAMESPACE
else
    echo "Helm release $RELEASE_NAME not found in namespace $NAMESPACE"
fi

echo "=== Deleting namespace: $NAMESPACE ==="
if kubectl get namespace $NAMESPACE &>/dev/null; then
    kubectl delete namespace $NAMESPACE
else
    echo "Namespace $NAMESPACE does not exist"
fi

echo "=== Removing Helm repo: $HELM_REPO_NAME ==="
if helm repo list | grep -q $HELM_REPO_NAME; then
    helm repo remove $HELM_REPO_NAME
else
    echo "Helm repo $HELM_REPO_NAME not found"
fi

echo "=== Killing any existing Argo CD port-forward ==="
PORT_FORWARD_PID=$(pgrep -f "kubectl port-forward.*${RELEASE_NAME}-server")
if [ -n "$PORT_FORWARD_PID" ]; then
    kill $PORT_FORWARD_PID
    echo "Killed port-forward PID $PORT_FORWARD_PID"
else
    echo "No port-forward process found"
fi

echo "Cleanup complete."

