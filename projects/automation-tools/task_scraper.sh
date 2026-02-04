#!/bin/bash


REPO="TheDanielMalka/DevOps-Roadmap-"
ISSUE_NUMBER=29

echo "Starting task scraper for Issue #$ISSUE_NUMBER..."

gh issue view $ISSUE_NUMBER --repo "$REPO" --json body > issue_data.json
echo "Data fetched and saved to issue_data.json"
