#!/bin/bash

OUTPUT_FILE="daily_tasks.txt"
echo "Report Date: $(date)" > $OUTPUT_FILE
echo "==========================" >> $OUTPUT_FILE

REPO_LIST=$(gh repo list --limit 100 --json nameWithOwner --jq '.[].nameWithOwner')

for REPO in $REPO_LIST; do
    echo "Checking: $REPO"
    
    ISSUE_LIST=$(gh issue list --repo "$REPO" --state open --json number --jq '.[].number' 2>/dev/null)
    
    if [ ! -z "$ISSUE_LIST" ]; then
        echo "--------------------------" >> $OUTPUT_FILE
        echo "REPOSITORY: $REPO" >> $OUTPUT_FILE
        echo "--------------------------" >> $OUTPUT_FILE

        for ISSUE_NUMBER in $ISSUE_LIST; do
            echo "  From Issue #$ISSUE_NUMBER:" >> $OUTPUT_FILE
            
            gh issue view $ISSUE_NUMBER --repo "$REPO" --json body --jq '.body' | grep "^- \[ \]" >> $OUTPUT_FILE
            
            echo "" >> $OUTPUT_FILE
        done
    fi
done

echo "Done! Summary saved to $OUTPUT_FILE"
