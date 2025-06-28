#!/bin/bash

LOG_FILE="logs/system.log"
REPORT_FILE="reports/log_summary_$(date +%Y%m%d_%H%M%S).txt"

# Create reports directory if it doesn't exist
mkdir -p ../reports

# Start logging
echo "Log Summary Report - $(date)" > "$REPORT_FILE"
echo "-----------------------------" >> "$REPORT_FILE"

# Total lines
echo "Total lines: $(wc -l < $LOG_FILE)" >> "$REPORT_FILE"

# Count errors and warnings
echo "ERRORs: $(grep -c 'ERROR' $LOG_FILE)" >> "$REPORT_FILE"
echo "WARNINGs: $(grep -c 'WARNING' $LOG_FILE)" >> "$REPORT_FILE"

# Top 5 most frequent words
echo "Top 5 words:" >> "$REPORT_FILE"
tr -s ' ' '\n' < "$LOG_FILE" | tr -d '[:punct:]' | tr '[:upper:]' '[:lower:]' \
| grep -v '^$' | sort | uniq -c | sort -nr | head -5 >> "$REPORT_FILE"

echo "Report saved to: $REPORT_FILE"

