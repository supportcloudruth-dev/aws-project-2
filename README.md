# AWS Project 2 – Automated Server Setup & Monitoring

## Project Overview

This project demonstrates the deployment and automation of an Ubuntu server environment on AWS.

The project focuses on configuring an EC2 server, connecting Amazon EFS for shared storage, automating server configuration with Bash scripting, and implementing Datadog monitoring for observability.

## Project Objectives

- Deploy and configure an Ubuntu EC2 server
- Automate server configuration using Bash
- Connect Amazon EFS to the server
- Configure persistent EFS mounting
- Install required Linux dependencies
- Implement server monitoring with Datadog
- Document the infrastructure and configuration process
- Follow secure practices when handling credentials

## AWS Services & Technologies

- Amazon EC2
- Amazon EFS
- AWS VPC
- Linux / Ubuntu
- Bash scripting
- NFS
- Datadog
- Git & GitHub

## Project Architecture

The infrastructure consists of an Ubuntu EC2 server connected to an Amazon EFS filesystem.

The server is configured automatically using a Bash script, while Datadog provides monitoring and observability.

## Implementation

### 1. Server Configuration

The Bash automation script:

- Sets the server hostname
- Updates Ubuntu packages
- Creates the EFS mount directory
- Installs required dependencies
- Configures the EFS mount
- Mounts the EFS filesystem
- Installs and configures the Datadog Agent

### 2. Amazon EFS

Amazon EFS provides shared and persistent network storage for the server.

The filesystem is mounted at:

`/home/ubuntu/webserver`

### 3. Monitoring

Datadog is used to monitor the server and provide visibility into system and application activity.

## Security Considerations

Sensitive credentials such as API keys, passwords, and private keys are not stored in this repository.

Credentials should be managed using secure secret-management methods rather than hard-coded inside scripts.

## Key Skills Demonstrated

- Linux server administration
- Bash automation
- AWS EC2
- Amazon EFS
- NFS
- Infrastructure configuration
- Monitoring and observability
- Git and GitHub
- Security best practices

## Project Status

 In Progress

More documentation, architecture diagrams, screenshots, and automation files will be added as the project progresses.

## Author

**SupportCloudruth**

Cloud Computing / AWS Learner
