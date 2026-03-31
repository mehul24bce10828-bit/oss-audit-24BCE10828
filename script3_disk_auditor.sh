#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: Mangal | Course: Open Source Software
# Description: Loops through key Linux directories and reports
#              permissions, owner, and size of each.

# --- List of important directories to audit ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/boot" "/proc" "/sys")

echo "=============================================="
echo "  Directory Audit Report"
echo "  System: $(uname -r)"
echo "  Date  : $(date '+%d %B %Y %H:%M')"
echo "=============================================="
echo ""

# --- for loop: iterate through each directory ---
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        # Extract permissions, owner, group using ls and awk
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')    # e.g. drwxr-xr-x
        OWNER=$(ls -ld "$DIR" | awk '{print $3}')    # e.g. root
        GROUP=$(ls -ld "$DIR" | awk '{print $4}')    # e.g. root
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)  # e.g. 4.0K

        echo "  Directory : $DIR"
        echo "  Perms     : $PERMS  |  Owner: $OWNER  |  Group: $GROUP"
        echo "  Size      : $SIZE"
        echo "  --------------------------------------------"
    else
        # Directory doesn't exist on this system
        echo "  [SKIP] $DIR does not exist on this system."
        echo "  --------------------------------------------"
    fi
done

# --- Check Linux kernel-specific directories ---
echo ""
echo "  === Linux Kernel Specific Directories ==="
echo ""

# /proc - virtual filesystem exposing live kernel data
KERNEL_DIRS=("/proc" "/sys" "/lib/modules/$(uname -r)")

for KDIR in "${KERNEL_DIRS[@]}"; do
    if [ -d "$KDIR" ]; then
        PERMS=$(ls -ld "$KDIR" | awk '{print $1}')
        OWNER=$(ls -ld "$KDIR" | awk '{print $3}')
        echo "  [KERNEL DIR] $KDIR"
        echo "  Perms: $PERMS  |  Owner: $OWNER"
        echo "  Purpose: $(case $KDIR in
            /proc) echo 'Live kernel & process info (virtual, no disk space used)' ;;
            /sys)  echo 'Hardware & driver info exposed by kernel (virtual)' ;;
            *)     echo 'Kernel modules (drivers) for current kernel version' ;;
        esac)"
        echo "  --------------------------------------------"
    fi
done

echo ""
echo "  Audit complete."
echo "=============================================="
