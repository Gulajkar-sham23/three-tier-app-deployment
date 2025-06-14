### Step-by-Step Configuration of "CI/CD Pipeline for Scalable Web Application" on AWS Using Jenkins ###
![image](https://github.com/user-attachments/assets/5f678698-e360-4857-b3b9-e94a878676d9)


## Project Tech Stack
- **AWS EC2** (App Hosting)
- **AWS ALB (Load Balancer)**
- **AWS Auto Scaling Group (ASG)**
- **Jenkins (CI/CD)**
- **AWS S3 (Artifact Storage)**
- **AWS CloudWatch (Logs & Monitoring)**

## Notes
- Jenkins to run on separate EC2 with AWS CLI and Docker installed.
- Auto Scaling Group ensures 1-3 EC2 based on CPU.
- S3 used for artifact storage.
- CloudWatch Logs set for monitoring.

---

## Optional Enhancements
- Slack notification plugin.
- Blue/Green deployment strategy.
- Integration with AWS CodeDeploy.


# CI/CD Pipeline for Scalable Web Application (AWS + Jenkins)

## Technologies Used
- AWS EC2, ALB, ASG
- Jenkins (Pipeline)
- AWS S3 (Artifact Storage)
- AWS CloudWatch (Logs)
- Flask Backend
- Terraform, Docker

## Features
- Automated build, test, deploy pipeline
- Scalable via Auto Scaling Group
- Load Balancer for high availability
- Automatic rollback on integration failures
- S3 storage for Docker artifacts
- CloudWatch monitoring

## Setup Guide
bash
cd terraform
terraform init
terraform apply


## Jenkins Pipeline
Configure Jenkins using the provided Jenkinsfile. AWS credentials should be stored securely using Jenkins credentials manager.

## Running Locally
bash
docker build -t mywebapp:latest .
docker run -p 5000:5000 mywebapp:latest
