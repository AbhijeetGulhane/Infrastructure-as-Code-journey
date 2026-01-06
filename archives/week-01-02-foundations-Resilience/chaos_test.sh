#!/bin/bash
# Get the ALB DNS
ALB_URL=$(terraform output -raw alb_dns_name)

echo "Starting Stress Test on $ALB_URL"
echo "Try terminating an instance in the AWS Console now..."

# Continuous loop to check for 200 OK responses
while true; do
  STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://$ALB_URL)
  if [ $STATUS -eq 200 ]; then
    echo "$(date): ✅ System Healthy (200 OK)"
  else
    echo "$(date): ❌ SYSTEM DOWN (Status: $STATUS)"
  fi
  sleep 10
done