#!/bin/bash
# Script 4: Log File Analyzer
# Author: Mangal | Course: Open Source Software
# Description: Reads a log file, counts keyword occurrences,
#              and prints matching lines. Accepts filename and keyword
#              as command-line arguments.
# Usage: ./script4_log_analyzer.sh <logfile> [keyword]

# --- Accept command-line arguments ---
LOGFILE=$1               # First argument: path to log file
KEYWORD=${2:-"error"}    # Second argument: keyword to search (default: "error")
COUNT=0                  # Counter variable to track keyword matches

echo "=============================================="
echo "  Log File Analyzer"
echo "  Kernel: $(uname -r)"
echo "=============================================="
echo ""

# --- Validate that a log file argument was provided ---
if [ -z "$LOGFILE" ]; then
    echo "  [USAGE] ./script4_log_analyzer.sh <logfile> [keyword]"
    echo "  Example: ./script4_log_analyzer.sh /var/log/dpkg.log error"
    exit 1
fi

# --- Check if the file actually exists ---
if [ ! -f "$LOGFILE" ]; then
    echo "  [ERROR] File not found: $LOGFILE"
    echo ""
    echo "  Tip: On Ubuntu WSL, try these log files:"
    echo "    /var/log/dpkg.log"
    echo "    /var/log/apt/history.log"
    echo "    /var/log/auth.log"
    exit 1
fi

# --- Check if file is empty and retry prompt ---
if [ ! -s "$LOGFILE" ]; then
    echo "  [WARNING] The file $LOGFILE is empty."
    echo "  Please enter a different log file path:"
    read -p "  New path: " LOGFILE    # Read new input from user

    # Check again after retry
    if [ ! -f "$LOGFILE" ] || [ ! -s "$LOGFILE" ]; then
        echo "  [ERROR] File still not valid. Exiting."
        exit 1
    fi
fi

echo "  Scanning : $LOGFILE"
echo "  Keyword  : '$KEYWORD'"
echo ""

# --- while read loop: read file line by line ---
while IFS= read -r LINE; do
    # if-then: check if this line contains the keyword (case-insensitive)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))   # Increment counter
    fi
done < "$LOGFILE"   # Feed file into the while loop

# --- Print summary ---
echo "----------------------------------------------"
echo "  RESULT: '$KEYWORD' found $COUNT time(s) in"
echo "  $(basename $LOGFILE)"
echo "----------------------------------------------"
echo ""

# --- Print last 5 matching lines using grep and tail ---
echo "  Last 5 lines containing '$KEYWORD':"
echo ""
grep -i "$KEYWORD" "$LOGFILE" | tail -5 | while read -r MATCH; do
    echo "    >> $MATCH"
done

echo ""
echo "  Analysis complete."
echo "=============================================="
