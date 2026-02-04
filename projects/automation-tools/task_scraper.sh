#!/bin/bash

OUTPUT_FILE="daily_tasks.txt"
LOG_FILE="task_sync.log"

log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

echo "Report Date: $(date)" > $OUTPUT_FILE
echo "==========================" >> $OUTPUT_FILE
log_message "Starting task synchronization..."

if ! gh auth status >/dev/null 2>&1; then
    log_message "ERROR: GitHub CLI is not authenticated."
    echo "Error: Please run 'gh auth login' first."
    exit 1
fi

REPO_LIST=$(gh repo list --limit 100 --json nameWithOwner --jq '.[].nameWithOwner' 2>/dev/null)
if [ $? -ne 0 ]; then
    log_message "ERROR: Failed to fetch repository list. Check your network connection."
    exit 1
fi

for REPO in $REPO_LIST; do
    log_message "Scanning $REPO..."
    
    ISSUE_LIST=$(gh issue list --repo "$REPO" --state open --json number --jq '.[].number' 2>/dev/null)
    
    if [ ! -z "$ISSUE_LIST" ]; then
        echo "--------------------------" >> $OUTPUT_FILE
        echo "REPOSITORY: $REPO" >> $OUTPUT_FILE
        echo "--------------------------" >> $OUTPUT_FILE

        for ISSUE_NUMBER in $ISSUE_LIST; do
            TASK_DATA=$(gh issue view $ISSUE_NUMBER --repo "$REPO" --json body --jq '.body' 2>/dev/null)
            
            if [ $? -eq 0 ]; then
                echo "  From Issue #$ISSUE_NUMBER:" >> $OUTPUT_FILE
                echo "$TASK_DATA" | grep "^- \[ \]" >> $OUTPUT_FILE
                echo "" >> $OUTPUT_FILE
            else
                log_message "WARNING: Could not fetch Issue  #$ISSUE_NUMBER from $REPO"
            fi
        done
    fi
done

log_message "Sync completed successfully."
echo "Done! Check $OUTPUT_FILE for tasks and $LOG_FILE for logs."
