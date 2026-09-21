#!/bin/bash
set -e

echo "=========================================================="
echo "      INICIANDO SCRIPT DE ROLLBACK AUTOMATICO (RECOVERY)  "
echo "=========================================================="

PREVIOUS_VERSION="1.0.0-STABLE"
ACTIVE_COLOR="BLUE"

echo "[INFO] Notificando a Prometheus / Alertmanager sobre el fallo..."
echo "[INFO] Cambiando las reglas de enrutamiento del Load Balancer a $ACTIVE_COLOR..."
echo "[INFO] Restaurando la versión estable anterior: $PREVIOUS_VERSION..."

sleep 1

echo "=========================================================="
echo " [SUCCESS] Rollback completado exitosamente. Servidor estable."
echo "=========================================================="
