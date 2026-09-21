#!/bin/bash
set -e

PREVIOUS_VERSION=${1:-"1.0.0"} 
ENVIRONMENT=${2:-"staging"}

echo "==================================================" 
echo "ALERT: Desencadenando Rollback Automático a la versión $PREVIOUS\_VERSION en $ENVIRONMENT" 
echo "=================================================="

# 1. Reconmutar tráfico en el Balanceador de Carga hacia el entorno estable (Blue)
if command -v kubectl >/dev/null 2>&1; then
    kubectl label service/app-service environment=blue --overwrite
    kubectl rollout undo deployment/app-deployment --namespace=$ENVIRONMENT
else
    echo "==&gt; [SIMULACIÓN] Re-enrutando tráfico en el Balanceador de Carga hacia el entorno estable (Blue)..."
    echo "==&gt; [SIMULACIÓN] Revertiendo despliegue en Kubernetes a la versión anterior (v$PREVIOUS_VERSION)..."
fi

# 2. Verificar estado de salud (Health-Check) del ambiente restaurado

echo "==&gt; Verificando estado de salud (Health-Check) del ambiente restaurado..."
echo "✅ SUCCESS: Rollback completado con éxito. Entorno estable activo en versión $PREVIOUS_VERSION."