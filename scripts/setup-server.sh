#!/bin/bash

set -e

# ==========================================
# AWS Project 2 - Server Setup Script
# ==========================================

# Change the server hostname
# ==========================================
sudo hostnamectl set-hostname Jumper-Server-01


# Update the Ubuntu server
# ==========================================
sudo apt update -y
sudo apt upgrade -y


# Create the EFS mount directory
# ==========================================
mkdir -p /home/ubuntu/webserver


# Install EFS/NFS dependencies
# ==========================================
sudo apt -y install nfs-common stunnel4 git binutils


# Configure Amazon EFS in /etc/fstab
# ==========================================
sudo tee -a /etc/fstab > /dev/null <<EOF
fs-0830aab8df1548209.efs.us-east-2.amazonaws.com:/ /home/ubuntu/webserver nfs4 nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport,_netdev 0 0
EOF


# Mount EFS
# ==========================================
sudo mount -a


# Configure Datadog
# ==========================================
# The API key must be supplied securely as an environment variable.
# Never hard-code the API key in this script.

: "${DD_API_KEY:?DD_API_KEY environment variable is not set}"

DD_SITE="${DD_SITE:-uk1.datadoghq.com}"

DD_APM_INSTRUMENTATION_ENABLED=host \
DD_DATA_STREAMS_ENABLED=true \
DD_PROFILING_ENABLED=auto \
DD_ENV=dev \
DD_APM_INSTRUMENTATION_LIBRARIES=java:1,python:4,js:5,php:1,dotnet:3,ruby:2 \
DD_LOGS_CONFIG_PROCESS_COLLECT_ALL=true \
DD_API_KEY="$DD_API_KEY" \
DD_SITE="$DD_SITE" \
bash -c "$(curl -L https://install.datadoghq.com/scripts/install_script_agent7.sh)"
