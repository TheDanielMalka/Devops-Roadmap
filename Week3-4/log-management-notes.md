# Log Management Notes

## System Logs (/var/log/)
- syslog - main system log, all services and events
- auth.log - login attempts, sudo, SSH connections
- kern.log - kernel messages, hardware, drivers, disks
- dmesg - boot messages

## Key Commands
- tail -20 /var/log/syslog - last 20 lines
- tail -f /var/log/syslog - follow in real-time

## Journald (journalctl)
- journalctl -u <service> - filter by service
- journalctl --since "1 hour ago" - filter by time
- journalctl -p err - filter by severity (errors only)
- journalctl -k - kernel messages only
- journalctl -n 20 - last 20 entries

## When to check which log
- Service down → syslog
- Login issues / security → auth.log
- Hardware / disk / RAM → kern.log
