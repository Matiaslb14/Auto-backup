# Proyecto 07 - Backup Automático y Restauración en Bash

Herramienta en **Bash** para realizar copias de seguridad comprimidas (`.tar.gz`) de directorios seleccionados, con opciones de exclusión, retención automática y restauración rápida.

## 🚀 Características
- Respaldo comprimido con sello de tiempo.
- Exclusión de carpetas y archivos mediante patrón.
- Filtra automáticamente directorios inexistentes.
- Evita auto-incluir el propio proyecto en el backup.
- Retención automática (borra backups antiguos según configuración).
- Soporta `pigz` para compresión más rápida.
- Restauración a cualquier directorio.
- Preparado para ejecución automática con `cron` o `systemd`.

## 📂 Estructura

07-auto-backup/
├── backups/ # Carpeta donde se guardan los .tar.gz
├── excludes/ # Patrones a excluir
├── logs/ # Registros de cada ejecución
├── scripts/
│ ├── backup.sh # Script principal de backup
│ └── restore.sh # Script de restauración
└── .env # Configuración del proyecto

## ⚙️ Configuración
Edita el archivo `.env` para definir:
```bash
# Carpetas a respaldar
BACKUP_SOURCES=("$HOME/linux-projects" "$HOME/Documents")

# Carpeta destino de backups
BACKUP_DEST="$PWD/backups"

# Prefijo de nombre
BACKUP_PREFIX="backup"

# Días para mantener backups
RETENTION_DAYS=7

# Correo para notificaciones (opcional, requiere 'mail' configurado)
EMAIL_TO=""

# Archivo de exclusiones
EXCLUDES_FILE="$PWD/excludes/patterns.txt"

Ejemplo de excludes/patterns.txt:

*.cache
*.log
node_modules
.git

▶️ Uso

Backup manual:

./scripts/backup.sh

Listar contenido de un backup:

./scripts/restore.sh --list backups/backup_mati_2025-08-11_20-15-34.tar.gz

Restaurar en carpeta específica:

./scripts/restore.sh backups/backup_mati_2025-08-11_20-15-34.tar.gz ~/restore_test

⏱️ Automatización con cron

crontab -e

Agrega:

0 2 * * * /bin/bash /home/mati/linux-projects/07-auto-backup/scripts/backup.sh >> /home/mati/linux-projects/07-auto-backup/logs/cron.log 2>&1

🛠️ Requisitos

Bash 4+

tar, gzip (o pigz opcional)

mailutils (opcional para notificaciones por correo)

Permisos de lectura en las carpetas a respaldar
