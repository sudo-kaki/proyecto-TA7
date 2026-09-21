#!/bin/bash
# Script de Rollback Automático en Deployment Pipeline
set -e

PREVIOUS_VERSION=$1
ENVIRONMENT=$2

echo "=================================================="
echo "ALERT: Desencadenando Rollback Automático a la versión $PREVIOUS_VERSION en $ENVIRONMENT"
echo "=================================================="

# 1. Reconmutar tráfico en el Balanceador de Carga / Ingress Router hacia el entorno estable (Blue)
kubectl label service/app-service environment=blue --overwrite

# 2. Revertir despliegue de Kubernetes a la revisión anterior
kubectl rollout undo deployment/app-deployment --namespace=$ENVIRONMENT

# 3. Verificar estado de salud (Health-Check) del ambiente restaurado
STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://app.empresa.cl/health)
if [ "$STATUS" -eq 200 ]; then
    echo "✅ SUCCESS: Rollback completado con éxito. Entorno estable activo en versión $PREVIOUS_VERSION."
else
    echo "❌ CRITICAL: El entorno no responde adecuadamente tras el rollback. Estado HTTP: $STATUS"
    exit 1
fi
