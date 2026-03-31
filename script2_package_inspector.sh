#!/bin/bash
# Script 2: FOSS Package Inspector
# Author: Mangal | Course: Open Source Software
# Description: Checks if a package is installed, shows its version,
#              and prints a philosophy note about the chosen software.

# --- Package to inspect ---
PACKAGE="linux-image-$(uname -r)"   # The currently running kernel package

# --- Check if the kernel package is installed using dpkg ---
echo "=============================================="
echo "  FOSS Package Inspector"
echo "=============================================="
echo ""

# if-then-else: check if package exists in dpkg database
if dpkg -l "$PACKAGE" &>/dev/null; then
    echo "  [FOUND] Package: $PACKAGE is installed."
    echo ""
    # Display version and description using dpkg and grep
    dpkg -l "$PACKAGE" | grep -E "^ii" | awk '{print "  Version : "$3"\n  Arch    : "$4}'
else
    echo "  [INFO] Exact package $PACKAGE not found via dpkg."
    echo "  Showing general kernel info instead:"
    echo ""
    echo "  Kernel Version : $(uname -r)"     # Fallback: show uname info
    echo "  Kernel Release : $(uname -v)"
fi

echo ""
echo "----------------------------------------------"
echo "  License & Source Info:"
echo "----------------------------------------------"

# --- case statement: print philosophy note based on software name ---
SOFTWARE="linux-kernel"   # Identifier for our software choice

case $SOFTWARE in
    linux-kernel)
        echo "  Linux Kernel: The open-source OS core that"
        echo "  powers 96% of the world's top servers,"
        echo "  Android phones, and every major cloud platform."
        echo "  Built by a student in 1991 — shared with the world."
        ;;
    httpd)
        echo "  Apache: The web server that built the open internet."
        ;;
    mysql)
        echo "  MySQL: Open source at the heart of millions of apps."
        ;;
    firefox)
        echo "  Firefox: A nonprofit's fight for an open, free web."
        ;;
    vlc)
        echo "  VLC: Built by students — plays anything, everywhere."
        ;;
    *)
        echo "  Unknown package. Please update the case statement."
        ;;
esac

echo ""
echo "  GPL v2 License: Source code must always remain free."
echo "=============================================="
