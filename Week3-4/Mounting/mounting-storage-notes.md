# Mounting & Storage Basics

## Key Commands
- lsblk - list all disks and partitions (shows unmounted too)
- df -h - show only mounted filesystems with usage
- mount /dev/sdb1 /mnt/usb - attach disk to directory
- umount /mnt/usb - detach disk

## Full Mount Process
1. dd if=/dev/zero of=disk.img bs=1M count=50 - create disk
2. mkfs.ext4 disk.img - format with filesystem
3. mkdir /mnt/drive - create mount point
4. mount disk.img /mnt/drive - connect disk to directory

## Concepts
- No drive letters in Linux (no C:\, D:\)
- Every disk must be mounted to a directory
- lsblk shows ALL disks, df -h shows only MOUNTED
- tmpfs = RAM as disk (fast, gone on reboot)
- SWAP = disk as RAM (slow, backup when RAM is full)
- ext4 = Linux filesystem format (like NTFS for Windows)
