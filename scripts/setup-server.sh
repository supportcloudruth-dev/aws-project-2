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
fs-0627a5ebb6530a55b.efs.us-east-2.amazonaws.com:/ /home/ubuntu/webserver nfs4 nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport,_netdev 0 0
EOF


# Mount EFS
# ==========================================
sudo mount -a


# Configure Datadog
# ==========================================
DD_API_KEY=5e7fac4159816687ffa788854f2e315b \
DD_APP_KEY=ddapp_ZeA0ZKoziiOxxVKEUbFZwrVSETUI1kJicM \
DD_SITE="datadoghq.com" \
DD_APM_INSTRUMENTATION_ENABLED=host \
DD_APM_INSTRUMENTATION_LIBRARIES=java:1,python:4,js:5,php:1,dotnet:3,ruby:2 \
DD_APPSEC_ENABLED=true \
DD_IAST_ENABLED=true \
DD_APPSEC_SCA_ENABLED=true \
DD_RUNTIME_SECURITY_CONFIG_ENABLED=true \
DD_COMPLIANCE_CONFIG_ENABLED=true \
DD_SBOM_CONTAINER_IMAGE_ENABLED=true \
DD_SBOM_HOST_ENABLED=true \
DD_DATA_STREAMS_ENABLED=true \
DD_PROFILING_ENABLED=auto \
DD_OTELCOLLECTOR_ENABLED=true \
DD_RUM_ENABLED=true \
DD_RUM_APPLICATION_ID=6e98b079-619d-451c-9dbb-73bed1cdcccb \
DD_RUM_CLIENT_TOKEN=pub92fad8d483c235aa0a0116157092639d \
DD_RUM_REMOTE_CONFIGURATION_ID=bf96a275-afb5-4385-8047-072b2934cee0 \
DD_RUM_SITE=datadoghq.com \
DD_PRIVATE_ACTION_RUNNER_ENABLED=true \
DD_PRIVATE_ACTION_RUNNER_ACTIONS_ALLOWLIST=com.datadoghq.script.runPredefinedScript \
bash -c "$(curl -L https://install.datadoghq.com/scripts/install_script_agent7.sh)"
