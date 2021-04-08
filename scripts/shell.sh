#!/bin/bash

SERVICE="${1}"

POD=$(kubectl get pods -n gomud -l "app=$SERVICE" -o jsonpath="{.items[0].metadata.name}")

kubectl exec -it -n gomud $POD -- /bin/bash
