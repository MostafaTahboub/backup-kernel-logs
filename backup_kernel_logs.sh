#!/bin/bash


OUTPUT_DIR="home/mostafa/Desktop/linux Project"

TIMESTAMP=$(date +"%Y-%m-%dT%H-%M")

LOG_FILE="$OUTPUT_DIR/kernel-logs-$TIMESTAMP.txt"

COMPRESSED_FILE="$OUTPUT_DIR/kernel-logs-$TIMESTAMP.tar.bz2"

journalctl -k --since "1 hour ago" > "$LOG_FILE"

tar -cjf "$COMPRESSED_FILE" -C "$OUTPUT_DIR" "kernel-logs-$TIMESTAMP.txt"

dbxcli put  "$COMPRESSED_FILE" "/home/mostafa/Dropbox/$COMPRESSED_FILE"

echo "Kernel logs backed up and uploaded to Dropbox."

