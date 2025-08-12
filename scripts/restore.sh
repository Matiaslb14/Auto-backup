#!/usr/bin/env bash
set -Eeuo pipefail
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")"/.. && pwd)"
cd "$BASE_DIR"

usage() {
  echo "Uso:"
  echo "  $0 --list /ruta/al/backup.tar.gz"
  echo "  $0 /ruta/al/backup.tar.gz [directorio_destino]"
  exit 1
}

if [[ $# -lt 1 ]]; then usage; fi

if [[ "$1" == "--list" ]]; then
  [[ -f "$2" ]] || usage
  tar -tf "$2"
  exit 0
fi

ARCHIVE="${1:-}"
TARGET_DIR="${2:-$PWD/restore}"

[[ -f "$ARCHIVE" ]] || { echo "[ERROR] No existe $ARCHIVE"; exit 1; }
mkdir -p "$TARGET_DIR"

echo "Restaurando $ARCHIVE en $TARGET_DIR ..."
tar -xpf "$ARCHIVE" -C "$TARGET_DIR"
echo "Listo. Contenido restaurado en: $TARGET_DIR"
