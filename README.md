# Multi-Cloud Deployment with Terraform (AWS + GCP)

## Overview
This project demonstrates how to deploy a multi-cloud infrastructure using Terraform. It provisions resources on AWS (EC2, S3, Load Balancer) and GCP (Compute Engine, Cloud Storage, Load Balancer)

## Prerequisites
- AWS and GCP accounts with necessary permissions
- Terraform installed
- AWS CLI and GCP SDK configured

## How to Run
1. Clone the repository:
   ```bash
   git clone https://github.com/TiraWeb/multi-cloud-terraform.git
   cd multi-cloud-terraform
2. Initialize Terraform:
   ```bash
   terraform init

3. Plan and apply the configuration:
   ```bash
   terraform plan
   terraform apply

4. Destroy the infrastructure (optional):
   ```bash
   terraform destroy


## AWS EC2 Instance
![image](https://github.com/user-attachments/assets/f24e762b-641d-46f4-9307-6a4f6244be62)

## S3 Bucket
![image](https://github.com/user-attachments/assets/543fcd6e-68d4-4d69-b6aa-d1a0e34fada7)

## GCP VM
![image](https://github.com/user-attachments/assets/c618daaf-44fd-435d-b0b1-1f8dcf741a6f)

## Terraform Apply
![image](https://github.com/user-attachments/assets/8197e601-798b-4717-9813-85b4fe3c4ae0)

## Lessons Learned
- **Multi-Cloud Challenges**: Managing resources across AWS and GCP required careful planning and testing
- **Terraform Debugging**: Debugging the Debian image issue taught me the importance of verifying resource availability

## Future Improvements
- Add **Kubernetes clusters** to both AWS (EKS) and GCP (GKE)
- Implement **Infrastructure as Code (IaC) testing** using tools like Terratest
- Add **cost optimization** using AWS Cost Explorer and GCP Billing Reports
