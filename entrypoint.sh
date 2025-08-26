#!/bin/bash

# Configure aws cli
aws configure set aws_secret_access_key "$AWS_SECRET_ACCESS_KEY" --profile "$AWS_USER"
aws configure set aws_access_key_id "$AWS_ACCESS_KEY_ID" --profile "$AWS_USER"
aws configure set region "$AWS_REGION" --profile "$AWS_USER"
aws configure set output json --profile "$AWS_USER"

# Install amazon.aws ansible plugin
ansible-galaxy collection install amazon.aws

# Wait to get instances
ansible all -m wait_for_connection -a "timeout=300"

echo "Launching playbooks"

# Launch playbooks
echo "playbook/export_inception.yml"
ansible-playbook playbook/export_inception.yml -v
echo "playbook/install_dependencies.yml"
ansible-playbook playbook/install_dependencies.yml -v
echo "playbook/start_inception.yml"
ansible-playbook playbook/start_inception.yml -v
echo "playbooks successfully executed !"

# Keep container alive
tail -f /dev/null