#!/bin/bash

#### Increment BASTION_ID to launch new box!
export BASTION_ID="04"
export AWS_REGION_CODE="us-west-2"
export AWS_REGION_NAME="Oregon"
export VPC_BASE="10.10"
export KEYPAIR="xaas-or"
export AMI="ami-9abea4fb"
export MGMT_IP="24.21.200.124/32"


/usr/local/bin/ansible-playbook -i contribl/ec2.py ./vpc-stage1.yml --vault-password-file ~/.vault_pass.txt 
/usr/local/bin/ansible-playbook -i contribl/ec2.py ./vpc-stage2.yml --vault-password-file ~/.vault_pass.txt
/usr/local/bin/ansible-playbook -i contribl/ec2.py ./vpc-stage3.yml --vault-password-file ~/.vault_pass.txt 
