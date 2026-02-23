# Special Permissions

## SUID (Set User ID)
- Marked with 's' on file owner execute: -rwsr-xr-x
- Command runs with owner (root) permissions temporarily
- Example: passwd command needs root to edit /etc/shadow

## SGID (Set Group ID)
- Marked with 's' on group execute for directories
- New files in directory inherit the directory's group
- Use case: shared team folders

## Sticky Bit
- Marked with 't' at the end: drwxrwxrwt
- Only file owner can delete their own files
- Example: /tmp - everyone can write, only owner can delete
