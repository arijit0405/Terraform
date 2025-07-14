

<img width="971" height="540" alt="Screenshot 2025-07-12 112522" src="https://github.com/user-attachments/assets/29acc2fc-8a93-4991-8b75-ebd703a395af" />


# 🛠️ End-to-End AWS Infrastructure Project using Terraform

This document explains step-by-step what was done in this real-world AWS infrastructure project using Terraform.

---

## ✅ Step 1: Login to AWS CLI

You authenticated to your AWS account using the following command:

```bash
aws configure
```

You provided your Access Key, Secret Key, Region, and output format.

---

## 📁 Step 2: Setup Terraform Project Directory

Created a new directory to hold all Terraform configuration files:

```bash
mkdir terraform-end-to-end-proj && cd terraform-end-to-end-proj
```

---

## 🌍 Step 3: Define Provider

In `provider.tf`, specified AWS as the infrastructure provider and defined the region:

```hcl
provider "aws" {
  region = "ap-south-1"
}
```

---

## 🔧 Step 4: Defined Resources in `main.tf`

### 1. **VPC Creation**

```hcl
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}
```

### 2. **Public Subnets in Two AZs**

```hcl
resource "aws_subnet" "sub1" {...}
resource "aws_subnet" "sub2" {...}
```

### 3. **Internet Gateway and Routing**

- IGW created and attached to VPC
- Route table created with a route to IGW
- Associated with both subnets

### 4. **Security Group**

```hcl
resource "aws_security_group" "webSg" {
  ingress for HTTP (port 80) and SSH (port 22)
  egress for all traffic
}
```

### 5. **S3 Bucket**

Created a basic S3 bucket named `my-tf-test-bucket`.

### 6. **EC2 Instances with User Data**

```hcl
resource "aws_instance" "webserver1" {...}
resource "aws_instance" "webserver2" {...}
```

Each instance used separate user data scripts (`userdata.sh`, `userdata1.sh`) to configure a simple web server.

### 7. **Application Load Balancer**

```hcl
resource "aws_lb" "test" {...}
```

Deployed a public Application Load Balancer (ALB) across both subnets.

### 8. **Target Group & Attachments**

- Created a target group to forward traffic to EC2 instances.
- Attached both EC2 instances to the ALB target group.

### 9. **ALB Listener**

```hcl
resource "aws_lb_listener" "listener" {...}
```

Listener on port 80 that forwards traffic to the target group.

---

## 🧪 What Was Achieved

- Complete infrastructure setup using Terraform
- High availability (2 AZs)
- Two EC2 web servers with automated configuration
- Load balancer to distribute traffic
- Public access via ALB DNS name
- Static file hosting support with S3


<img width="1358" height="388" alt="Screenshot 2025-07-14 162827" src="https://github.com/user-attachments/assets/60dbf20a-0979-46c8-baed-40cad2b3f7fc" />


<img width="1365" height="430" alt="Screenshot 2025-07-14 162814" src="https://github.com/user-attachments/assets/7d3eac3b-f408-41f6-a24b-ed4b5d8f307d" />

