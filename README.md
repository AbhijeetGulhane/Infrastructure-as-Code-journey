# 🚀 Infrastructure-as-Code Journey (SRE Roadmap)

[![Terraform](https://img.shields.io/badge/Terraform-1.10+-623CE4?logo=terraform)](https://www.terraform.io/)
[![AWS](https://img.shields.io/badge/AWS-Free--Tier-orange?logo=amazon-aws)](https://aws.amazon.com/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

This repository documents my journey and technical progression in Site Reliability Engineering. It contains production-grade Terraform configurations, architectural patterns, and automation workflows.

## 🏗️ Architecture: The Resilient Web Cluster
The current state of this infrastructure is a **Multi-AZ, Self-Healing, and Secret-Aware** web cluster designed to survive data center failures and follow Zero-Trust security principles.



### **Core Capabilities:**
- **Zero-Trust Identity:** EC2 instances use IAM Roles (Instance Profiles) to fetch secrets dynamically—no hardcoded keys.
- **High Availability:** Traffic is balanced across multiple Availability Zones using an Application Load Balancer (ALB).
- **Self-Healing:** Auto Scaling Groups (ASG) monitor instance health and automatically replace failed nodes.
- **Observability:** Integrated CloudWatch Dashboards and SNS alerting for real-time monitoring of fleet health.

---

## 🏆 Featured Projects

### **Project 1: Multi-Environment Portfolio Engine**
A production-grade framework that deploys isolated static websites across multiple environments using a single codebase.
* **Core Feature:** Environment isolation using **Terraform Workspaces** (`dev` vs `prod`).
* **Backend:** Remote state managed via S3 with DynamoDB state locking.
* **Infrastructure:** Custom S3 Website modules with automated policy injection.
* **Results:**
    * [Dev URL](http://abhijeet-portfolio-dev-2025.s3-website-us-east-1.amazonaws.com)
    * [Prod URL](http://abhijeet-portfolio-prod-2025.s3-website-us-east-1.amazonaws.com)

### **Project 2: The Security-Hardened Fleet (Week 4 Capstone)**
The culmination of the networking and security phases, moving from public-facing instances to a private, secret-aware infrastructure.
* **Secrets Management:** 100% removal of hardcoded credentials using **AWS Secrets Manager**.
* **Identity & Access:** Implemented IAM Roles and Policies to grant "Least Privilege" access to cloud resources.
* **Network Isolation:** Deployment of servers in private subnets, accessible only through a hardened Load Balancer.

---

## 📝 Progression Log

### **Week 4: Security & Secret Management**
**Focus:** "Infrastructure Hardening"
- **IAM Instance Profiles:** Eliminated programmatic keys by assigning digital identities to EC2.
- **AWS Secrets Manager:** Implemented secure injection of API Keys and environment variables.
- **Bootstrap Automation:** Enhanced `user_data` to fetch secrets at runtime using the AWS CLI and `jq`.
- **Modular Refactoring:** Organized the repo by moving historical logic to `/archives` to maintain state continuity.

### **Week 3: Observability & Resilience**
**Focus:** "Making Infrastructure Visible"
- **Load Balancing:** Implemented an ALB to distribute traffic and handle SSL termination points.
- **Health Checks:** Configured aggressive thresholds to ensure zero-downtime during fleet rotations.
- **CloudWatch Dashboards:** Built a centralized performance view for monitoring fleet-wide CPU utilization.
- **SNS Alerts:** Automated email notifications for infrastructure anomalies.

### **Week 2: Networking & Connectivity**
**Focus:** "The Cloud Skeleton"
- **VPC Design:** Built a custom VPC with dynamic subnetting across multiple AZs.
- **Cost Engineering:** Replaced expensive NAT Gateways with a custom **NAT Instance** (Amazon Linux 2023) to stay within the AWS Free Tier.
- **Security Group Chaining:** Implemented "Least Privilege" where web servers only accept traffic from the ALB.

### **Week 1: Foundations & State**
**Focus:** "The IaC Lifecycle"
- **State Management:** Migrated local state to S3 with DynamoDB locking.
- **Modules:** Refactored S3 logic into a reusable child module.
- **Workspaces:** Mastered environment switching for `dev` and `prod` deployments.

---

## 📁 Repository Structure
```text
Infrastructure-as-Code-journey/
├── main.tf                  # Root: Module orchestration
├── variables.tf             # Root: Global inputs
├── outputs.tf               # Root: High-level endpoints
├── terraform.tfvars         # Root: Environment values
├── modules/
│   ├── networking/          # VPC, ALB, ASG, IAM, & Secrets
│   └── monitoring/          # CloudWatch Alarms & SNS
└── archives/                # Historical milestones (Week 1-3)
```

## ⚙️ How to Deploy
**Initialize**: ```bash terraform init -reconfigure
**Format & Validate**: ```bash terraform fmt -recursive && terraform validate
**Plan**: ```bash terraform plan -out=tfplan
**Deploy**: ```bash terraform apply "tfplan"
**Cleanup**: ```bash terraform destroy -auto-approve


## 🧠 SRE Skills Demonstrated
**Infrastructure as Code**: Advanced modularization and variable inheritance patterns.
**Security**: Secrets management, IAM Least Privilege, and Security Group hardening.
**Cost Optimization**: Engineering around cloud provider costs (NAT Instance vs NAT Gateway).
**Automation**: Bash bootstrapping for application-level configuration and runtime security.
