#!/bin/bash

SSM_AGENT_RPM=https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)

# install ansible
if [ ! -e /usr/bin/python3 ]; then
    yum -y install python3
    yum -y install python3-pip unzip
    pip3 install -U pip
    python3 -m pip install boto3 botocore ansible requests
    ansible-galaxy collection install ansible.posix
    mkdir -p /etc/ansible
    mkdir -p /var/log/ansible
fi

# Configure Ansible
cat <<EOF > /etc/ansible/ansible.cfg
[defaults]
log_path = /var/log/ansible/localhost.log
interpreter_python = /usr/bin/python3
collections_paths = /root/.ansible/collections/ansible_collections
EOF

# Configure logrotate
cat <<EOF > /etc/logrotate.d/ansible-localhost
/var/log/ansible/localhost.log {
  copytruncate
  daily
  missingok
  rotate 7
  compress
  delaycompress
  notifempty
  create 644 root root
}
EOF

# Install and start ssm agent
yum install -y $SSM_AGENT_RPM

# Start SSM Agent
systemctl start amazon-ssm-agent
