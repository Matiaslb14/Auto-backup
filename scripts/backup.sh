#!/usr/bin/env bash
# Proyecto 07 - Auto Backup
# Versión robusta: excluye el propio proyecto, ignora lecturas fallidas,
# filtra fuentes inexistentes y registra logs.

set -Eeuo pipefail

# === Setup base ===
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")"/.. && pwd)"
cd "$BASE_DIR"

# === Cargar configuración ===
if [[ -f ".env" ]]; then
  # shellcheck disable=SC1091
  source ".env"
else
  echo "[ERROR] No existe $BASE_DIR/.env"; exit 1
fi

# === Preparar rutas y logs ===
mkdir -p "${BACKUP_DEST:-$BASE_DIR/backups}" "$BASE_DIR/logs"

STAMP="$(date +%F_%H-%M-%S)"
HOST="$(hostname -s || echo host)"
ARCHIVE="${BACKUP_DEST%/}/${BACKUP_PREFIX:-backup}_${HOST}_${STAMP}.tar.gz"
LOG_FILE="$BASE_DIR/logs/backup_${STAMP}.log"

# === Excludes ===
TAR_EXCLUDES=()
# Excluir por archivo de patrones (si existe)
if [[ -n "${EXCLUDES_FILE:-}" && -f "$EXCLUDES_FILE" ]]; then
  TAR_EXCLUDES+=(--exclude-from="$EXCLUDES_FILE")
fi
# Evitar auto-incluir el propio proyecto/archivo y logs
TAR_EXCLUDES+=(--exclude="$BACKUP_DEST" --exclude="$BASE_DIR" --exclude="$BASE_DIR/logs")

# Continuar si hay archivos sin permiso y evitar warning de "file changed"
TAR_FLAGS=(--ignore-failed-read --warning=no-file-changed)
