#!/bin/bash
sudo apt-get update
sudo apt-get install -y ansible awscli unzip

S3_BUCKET="${s3_bucket_name}"
S3_REGION="${default_region}"

# Download the zipped Ansible roles from S3
aws s3 cp s3://$S3_BUCKET/playbook.zip /home/ubuntu/playbook.zip --region $S3_REGION

# Unzip the roles
unzip /home/ubuntu/playbook.zip -d /home/ubuntu/

# Ensure Ansible config file exists
echo "[defaults]" > /etc/ansible/ansible.cfg
echo "roles_path = /home/ubuntu/roles" >> /etc/ansible/ansible.cfg

# Create an Ansible inventory file with the current instance
echo "[ec2_instances]" > /etc/ansible/hosts
echo "$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4) ansible_connection=local" >> /etc/ansible/hosts

# Run the playbook
ansible-playbook /home/ubuntu/playbook/playbook.yml
