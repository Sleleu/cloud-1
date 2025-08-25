#!/bin/bash

# Configure aws cli
aws configure set aws_secret_access_key "$AWS_SECRET_ACCESS_KEY" --profile "$AWS_USER"
aws configure set aws_access_key_id "$AWS_ACCESS_KEY_ID" --profile "$AWS_USER"
aws configure set region "$AWS_REGION" --profile "$AWS_USER"
aws configure set output json --profile "$AWS_USER"

# Install amazon.aws ansible plugin
ansible-galaxy collection install amazon.aws

# Keep container alive
tail -f /dev/null