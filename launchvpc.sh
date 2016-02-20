#!/bin/bash

/usr/local/bin/ansible-playbook -i contribl/ec2.py ./make-vpc.yml --vault-password-file ~/.vault_pass.txt
