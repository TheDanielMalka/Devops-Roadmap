# FHS - Filesystem Hierarchy Standard

## Directory Structure
- / - root, everything starts here
- /bin - basic commands (ls, cp, cat, grep)
- /sbin - system commands requiring root (mount, fdisk)
- /etc - all configuration files
- /home - user home directories
- /var - variable data (logs, cache, mail)
- /tmp - temporary files, cleared on reboot
- /opt - third-party software
- /proc - live process info from kernel (not real files)
- /dev - hardware devices as files
- /boot - kernel and boot files
- /root - root user's home directory
- /lib - shared libraries for /bin and /sbin
- /mnt - mount points for external filesystems
- /srv - service data (web, FTP)
- /run - runtime data for running services

## Key Principle
Everything is a file. No drive letters (C:\), one tree from /
