#!/bin/bash
set -e

source .env

#ansible-playbook -v linode-create-gpu-server.yml \
#  --extra-vars="username=user password=linodeGPUTesting root_password=utz6mnSofqKdc52F"

ansible-playbook -v linode-create-gpu-server.yml
