#!/bin/bash

# Get today's date
DATE=$(date +%Y%m%d)

# Define log file path
LOGFILE="../logs/syslog-$DATE.log"

# Collect system info
{
  echo "===== System Info Log: $DATE ====="
  echo "User: $(whoami)"
  echo "Hostname: $(hostname)"
  echo "Uptime: $(uptime)"
  echo "Date: $(date)"
  echo "Disk Usage:"
  df -h
  echo "Memory Usage:"
  vm_stat
  echo "Logged In Users:"
  who
} > "$LOGFILE"

echo "Log written to $LOGFILE"

