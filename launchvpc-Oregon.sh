#!/bin/bash

#### Increment BASTION_ID to launch new box!
### Otherwise script will behave idempotently
export BASTION_IDEMPOTENT_ID="74"

export REGION="us-west-2"
export ZONEA="us-west-2a"
export ZONEB="us-west-2b"
export ZONEC="us-west-2c"

export VPC_BASE="10.10"
export KEYPAIR="xaas-or"
export MGMT_IP="`curl -s icanhazip.com`/32"

export BASTION_IMAGE_NAME="ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"
export BASTION_IMAGE_OWNER="099720109477"

export ECS_IMAGE_NAME="ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"
export ECS_IMAGE_OWNER="099720109477"

/usr/local/bin/ansible-playbook -i contribl/ec2.py ./vpc-stage1.yml
/usr/local/bin/ansible-playbook -i contribl/ec2.py ./vpc-stage2.yml
/usr/local/bin/ansible-playbook -i contribl/ec2.py ./vpc-stage3.yml
/usr/local/bin/ansible-playbook -i contribl/ec2.py ./vpc-ecs-cluster.yml
