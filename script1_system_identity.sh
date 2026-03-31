#!/bin/bash
# Script 1: System Identity Report
# Author: Mangal | Course: Open Source Software
# Description: Displays a welcome screen with full system identity info
# Chosen Software: Linux Kernel

# --- Variables ---
STUDENT_NAME="Mangal"                  # Student name
SOFTWARE_CHOICE="Linux Kernel"         # Software being audited
LICENSE="GNU General Public License v2 (GPL v2)"  # Kernel's license

# --- Gather system info using command substitution ---
KERNEL=$(uname -r)                           # Get current running kernel version
DISTRO=$(lsb_release -d 2>/dev/null | cut -f2 || cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | tr -d '"')
USER_NAME=$(whoami)                          # Get logged-in username
HOME_DIR=$HOME                               # Get home directory path
UPTIME=$(uptime -p)                          # Get uptime in human-readable form
CURRENT_DATE=$(date '+%A, %d %B %Y %H:%M')  # Get formatted current date and time
ARCH=$(uname -m)                             # Get system architecture

# --- Display the identity report ---
echo "=============================================="
echo "   Open Source Audit — $STUDENT_NAME"
echo "   Software Under Audit: $SOFTWARE_CHOICE"
echo "=============================================="
echo ""
echo "  Distribution : $DISTRO"
echo "  Kernel Ver   : $KERNEL"
echo "  Architecture : $ARCH"
echo "  User         : $USER_NAME"
echo "  Home Dir     : $HOME_DIR"
echo "  Uptime       : $UPTIME"
echo "  Date & Time  : $CURRENT_DATE"
echo ""
echo "----------------------------------------------"
echo "  OS License   : $LICENSE"
echo ""
echo "  The Linux Kernel is covered by GPL v2."
echo "  This means anyone can view, modify, and"
echo "  redistribute the source code — as long as"
echo "  they share their changes under the same"
echo "  license. Freedom is protected by law."
echo "----------------------------------------------"
