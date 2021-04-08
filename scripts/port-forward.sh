#!/bin/bash

SERVICE="${1}"
PORT="${2:-8080}"

POD=$(kubectl get pods -n gomud -l "app=$SERVICE" -o jsonpath="{.items[0].metadata.name}")
echo $POD
kubectl port-forward -n gomud pods/$POD $PORT
