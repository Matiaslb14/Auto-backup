# 🗄️ Automatic Backup & Restore in Bash  
### (Respaldo y Restauración Automática en Bash)

---

## 🧩 Overview / Descripción  

**EN:**  
This Bash tool automates the creation of compressed (.tar.gz) backups for selected directories, supports file exclusions, automatic retention, and quick restoration.  
Ideal for sysadmins and DevOps learners who need reliable, scriptable backup automation.  

**ES:**  
Esta herramienta en Bash automatiza la creación de respaldos comprimidos (.tar.gz) de directorios seleccionados, con exclusiones, retención automática y restauración rápida.  
Ideal para administradores de sistemas y estudiantes de DevOps que necesitan automatización de respaldos confiable y sencilla.  

---

## 📋 Features / Funciones  

| Feature (EN) | Descripción (ES) |
| ------------- | ---------------- |
| Compressed backups with timestamp | Respaldos comprimidos con marca de tiempo |
| Folder and file exclusion patterns | Exclusión de carpetas y archivos mediante patrones |
| Automatic retention cleanup | Eliminación automática de respaldos antiguos |
| Quick restore to any directory | Restauración rápida en cualquier carpeta |
| Self-exclusion of project | Previene incluir el propio proyecto en el respaldo |
| Optional pigz support for speed | Soporte opcional para `pigz` (compresión más rápida) |
| Ready for cron or systemd automation | Listo para automatización con cron o systemd |

---

## 📂 Structure / Estructura del Proyecto  

07-auto-backup/
├── backups/ # Backup storage folder / Carpeta de respaldos
├── excludes/ # Exclusion patterns / Patrones de exclusión
├── logs/ # Execution logs / Registros de ejecución
├── scripts/
│ ├── backup.sh # Main backup script / Script principal
│ └── restore.sh # Restore script / Script de restauración
└── .env # Project configuration / Configuración del proyecto

---

## ⚙️ Configuration / Configuración  

**EN:** Edit the `.env` file to set backup sources, destination, prefix, and retention days.  
**ES:** Edita el archivo `.env` para definir fuentes, destino, prefijo y días de retención.

| Variable | Description (EN) | Descripción (ES) |
| -------- | ---------------- | ---------------- |
| `BACKUP_SOURCES` | Folders to back up | Carpetas a respaldar |
| `BACKUP_DEST` | Destination folder | Carpeta destino |
| `BACKUP_PREFIX` | Backup name prefix | Prefijo del respaldo |
| `RETENTION_DAYS` | Days to keep backups | Días de retención |
| `EMAIL_TO` | Email for notifications (optional) | Correo para notificaciones (opcional) |
| `EXCLUDES_FILE` | Path to exclusion patterns | Ruta del archivo de exclusiones |

Example (`excludes/patterns.txt`):

*.cache
*.log
node_modules
.git

---

## ▶️ Usage / Uso  

| Action (EN) | Comando | Acción (ES) |
| ------------ | -------- | ------------ |
| Manual backup | `./scripts/backup.sh` | Respaldar manualmente |
| List backup contents | `./scripts/restore.sh --list backups/backup_mati_2025-08-11_20-15-34.tar.gz` | Listar contenido de respaldo |
| Restore backup | `./scripts/restore.sh backups/backup_mati_2025-08-11_20-15-34.tar.gz ~/restore_test` | Restaurar respaldo |

---

## ⏱️ Automation / Automatización  

**EN:** Add a cron job to automate backups daily at 2 AM.  
**ES:** Agrega una tarea `cron` para automatizar respaldos diarios a las 2 AM.

crontab -e

Then add:

0 2 * * * /bin/bash /home/mati/linux-projects/07-auto-backup/scripts/backup.sh >> /home/mati/linux-projects/07-auto-backup/logs/cron.log 2>&1

## 🛠️ Requirements / Requisitos  

| Requirement | Description (EN) | Descripción (ES) |
| ------------ | ---------------- | ---------------- |
| `bash 4+` | Shell environment | Entorno de shell |
| `tar`, `gzip` / `pigz` | Compression utilities | Utilidades de compresión |

---

## 🧠 Notes / Notas  

**EN:**  
This project is part of my Linux Automation & Security Toolkit series, focusing on practical scripting for infrastructure reliability and security.  

**ES:**  
Este proyecto forma parte de mi serie Linux Automation & Security Toolkit, enfocada en scripting práctico para la confiabilidad y seguridad de la infraestructura.  

---

👨‍💻 Developed by Matías Lagos Barra — Cloud & DevSecOps Engineer
