#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Author: Mangal | Course: Open Source Software
# Description: Asks the user 3 interactive questions and generates
#              a personalised open source philosophy statement,
#              saved to a .txt file.

# --- alias concept: demonstrate via comment ---
# In a real shell session you could run: alias today='date +%d\ %B\ %Y'
# Here we use a variable to achieve the same result cleanly in a script
DATE=$(date '+%d %B %Y')          # Current date for the manifesto
OUTPUT="manifesto_$(whoami).txt"  # Output filename based on username

echo "=============================================="
echo "  Open Source Manifesto Generator"
echo "  Linux Kernel Audit Project"
echo "=============================================="
echo ""
echo "  Answer three questions to create your"
echo "  personal open source philosophy statement."
echo ""

# --- read: get interactive input from the user ---
read -p "  1. Name one open-source tool you use every day: " TOOL
read -p "  2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "  3. Name one thing you would build and share freely: " BUILD

echo ""
echo "  Generating your manifesto..."
echo ""

# --- String concatenation: build the manifesto paragraph ---
# Write the manifesto to the output file using > (overwrite)
echo "=============================================="  > "$OUTPUT"
echo "  MY OPEN SOURCE MANIFESTO"                    >> "$OUTPUT"
echo "  By: $(whoami) | Date: $DATE"                 >> "$OUTPUT"
echo "=============================================="  >> "$OUTPUT"
echo ""                                               >> "$OUTPUT"

# Main paragraph using the user's three answers
echo "  Every day, I rely on $TOOL — a tool that"    >> "$OUTPUT"
echo "  exists because someone chose to build in"    >> "$OUTPUT"
echo "  the open and share their work freely."       >> "$OUTPUT"
echo ""                                               >> "$OUTPUT"
echo "  To me, freedom means $FREEDOM. That is"      >> "$OUTPUT"
echo "  exactly what the Linux Kernel represents:"   >> "$OUTPUT"
echo "  the freedom to see how your computer works," >> "$OUTPUT"
echo "  change it, and pass that knowledge on."      >> "$OUTPUT"
echo ""                                               >> "$OUTPUT"
echo "  Inspired by Linus Torvalds — who shared his" >> "$OUTPUT"
echo "  kernel with the world in 1991 — I too want"  >> "$OUTPUT"
echo "  to build $BUILD and release it freely,"      >> "$OUTPUT"
echo "  so that anyone, anywhere, can use it,"       >> "$OUTPUT"
echo "  improve it, and stand on my shoulders"       >> "$OUTPUT"
echo "  just as I stand on the shoulders of those"   >> "$OUTPUT"
echo "  who came before me."                         >> "$OUTPUT"
echo ""                                               >> "$OUTPUT"
echo "  This is the open source promise."            >> "$OUTPUT"
echo "=============================================="  >> "$OUTPUT"

# --- Display the saved manifesto ---
echo "  Manifesto saved to: $OUTPUT"
echo ""
cat "$OUTPUT"   # Print the file contents to screen
