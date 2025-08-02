#!/bin/bash

# Set variables for notification service and credentials
NOTIFICATION_SERVICE="https://example.com/notify"
USERNAME="your_username"
PASSWORD="your_password"
AUTH_TOKEN=$(echo -n "$USERNAME:$PASSWORD" | base64)

# Set variables for CLI tool arguments
NOTIFICATION_MESSAGE=$1
NOTIFICATION_TYPE=$2

# Function to send notification
send_notification() {
  curl -X POST \
  $NOTIFICATION_SERVICE \
  -H 'Authorization: Basic '$AUTH_TOKEN \
  -H 'Content-Type: application/json' \
  -d '{"message":"'${NOTIFICATION_MESSAGE}'", "type":"'${NOTIFICATION_TYPE}'"}'
}

# Check if CLI tool arguments are provided
if [ -z "$NOTIFICATION_MESSAGE" ] || [ -z "$NOTIFICATION_TYPE" ]; then
  echo "Error: Please provide notification message and type."
  exit 1
fi

# Send notification
send_notification

echo "Notification sent successfully!"