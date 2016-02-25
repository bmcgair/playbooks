#!/bin/bash

#### Increment BASTION_ID to launch new box!
### Otherwise script will behave idempotently
export BASTION_IDEMPOTENT_ID="75"

export REGION="us-east-1"
export ZONEA="us-east-1a"
export ZONEB="us-east-1b"
export ZONEC="us-east-1e"

export VPC_BASE="10.20"
export KEYPAIR="xaas-va"
export MGMT_IP="`curl -s icanhazip.com`/32"


export BASTION_IMAGE_NAME="ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"
export BASTION_IMAGE_OWNER="099720109477"

/usr/local/bin/ansible-playbook -i contribl/ec2.py ./vpc-stage1.yml
/usr/local/bin/ansible-playbook -i contribl/ec2.py ./vpc-stage2.yml
/usr/local/bin/ansible-playbook -i contribl/ec2.py ./vpc-stage3.yml
