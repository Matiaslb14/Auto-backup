# 🗄️ Project 07 – Automatic Backup & Restore in Bash

Tool written in Bash to create compressed (.tar.gz) backups of selected directories, with exclusion options, automatic retention, and quick restoration.

🚀 Features

Compressed backups with timestamp.
Exclusion of folders and files via pattern matching.
Automatically skips non-existent directories.
Prevents self-inclusion of the project in backups.
Automatic retention (deletes old backups according to settings).
Supports pigz for faster compression.
Restoration to any directory.
Ready for automation with cron or systemd.

📂 Structure
07-auto-backup/
├── backups/      # Folder where .tar.gz files are stored
├── excludes/     # Exclusion patterns
├── logs/         # Execution logs
├── scripts/
│   ├── backup.sh # Main backup script
│   └── restore.sh# Restore script
└── .env          # Project configuration

⚙️ Configuration

Edit the .env file to define:

Folders to back up
BACKUP_SOURCES=("$HOME/linux-projects" "$HOME/Documents")

Destination folder for backups
BACKUP_DEST="$PWD/backups"

Backup name prefix
BACKUP_PREFIX="backup"

Days to keep backups
RETENTION_DAYS=7

Email for notifications (optional, requires 'mail' configured)
EMAIL_TO=""

Exclusion file
EXCLUDES_FILE="$PWD/excludes/patterns.txt"

Example excludes/patterns.txt:

*.cache
*.log
node_modules
.git

▶️ Usage

Manual backup:
./scripts/backup.sh

List the contents of a backup:
./scripts/restore.sh --list backups/backup_mati_2025-08-11_20-15-34.tar.gz

Restore to a specific folder:
./scripts/restore.sh backups/backup_mati_2025-08-11_20-15-34.tar.gz ~/restore_test

⏱️ Automation with cron
Edit crontab:
crontab -e

Add:
0 2 * * * /bin/bash /home/mati/linux-projects/07-auto-backup/scripts/backup.sh >> /home/mati/linux-projects/07-auto-backup/logs/cron.log 2>&1

🛠️ Requirements

Bash 4+
tar, gzip (or optional pigz for faster compression)
mailutils (optional for email notifications)
Read permissions for the folders to be backed up
