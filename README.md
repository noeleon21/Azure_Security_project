# Azure Security Project

## Overview

This project provides a comprehensive Infrastructure as Code (IaC) solution for deploying a secure cloud infrastructure on Microsoft Azure using Terraform. It implements industry-standard security best practices and cloud security controls.

## 🏗️ Project Structure

### Main Terraform Configuration (`terraform/`)
- **main.tf** - Primary Terraform configuration file
- **variables.tf** - Variable definitions for infrastructure parameters
- **terraform.tfvars** - Variable values configuration
- **Virtual_machine.tf** - Azure Virtual Machine configurations
- **Virtual_Network.tf** - Azure Virtual Network and subnet definitions
- **entra_id.tf** - Microsoft Entra ID (Azure AD) configurations

### Additional Infrastructure Files (`Other_tf_files/`)
- **azure_firewall.tf** - Azure Firewall rules and configurations
- **cloud_security.tf** - Cloud security policies and controls
- **key_vault.tf** - Azure Key Vault for secrets and certificate management
- **sentinel.tf** - Microsoft Sentinel SIEM configuration
- **storage_account.tf** - Azure Storage Account configurations
- **outputs.tf** - Terraform output values

### Supporting Resources
- **install_webserver.sh** - Web server installation and configuration script
- **id_rsa.pub** - SSH public key for secure VM access

## 🔒 Security Features

This infrastructure includes:
- **Network Security**: Azure Firewall and Virtual Network segmentation
- **Identity & Access Management**: Entra ID integration and RBAC controls
- **Secrets Management**: Key Vault for secure credential storage
- **Security Monitoring**: Microsoft Sentinel for threat detection and response
- **Data Protection**: Encrypted storage accounts
- **Compute Security**: Hardened virtual machine configurations


## 📝 Configuration

Update `terraform/terraform.tfvars` with your specific values:
- Azure subscription ID
- Resource group name
- Region and location preferences
- VM sizes and specifications
- Network CIDR ranges

## 🔑 Key Components

### Virtual Network
- Isolated VNet for secure communication
- Configured subnets for different workload tiers
- Network Security Groups for traffic control

### Compute
- Azure Virtual Machines with security hardening
- Web server deployment via installation script
- SSH-based secure access

### Security Services
- **Key Vault**: Centralized secrets management
- **Sentinel**: Security information and event management
- **Azure Firewall**: Centralized firewall protection

### Identity
- Entra ID integration for authentication
- Role-based access control (RBAC)


