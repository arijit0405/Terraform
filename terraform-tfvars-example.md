# Terraform `.tfvars` Example: How to Use External Variables

This guide demonstrates how to use a `.tfvars` file in Terraform to pass dynamic variables for reusable infrastructure provisioning.

---

### ✅ Goal:
Provision an EC2 instance on AWS where the values like `region`, `instance_type`, `ami_id`, and `tags` are passed via a `.tfvars` file.

---

### 🔧 Step 1: `variables.tf`

Define input variables.

```hcl
variable "region" {
  description = "AWS region"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2"
  type        = string
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
}

variable "instance_name" {
  description = "Tag Name of the EC2 instance"
  type        = string
}
```

---

### 📄 Step 2: `main.tf`

Use the variables.

```hcl
provider "aws" {
  region = var.region
}

resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}
```

---

### 📝 Step 3: `terraform.tfvars`

Create the `.tfvars` file with actual values.

```hcl
region         = "us-east-1"
ami_id         = "ami-0c55b159cbfafe1f0"
instance_type  = "t2.micro"
instance_name  = "MyDemoInstance"
```

---

### ▶️ Step 4: Initialize and Apply

```bash
terraform init
terraform apply -var-file="terraform.tfvars"
```

---

### ✅ Outcome:

Terraform uses the values from `terraform.tfvars` and provisions an EC2 instance accordingly.

---

### 🚀 Summary

- `variables.tf`: Declares variables.
- `main.tf`: Uses the variables.
- `terraform.tfvars`: Supplies actual values.
- Run with: `terraform apply -var-file="terraform.tfvars"`

You now have a clean, reusable Terraform setup with externalized variables using `.tfvars`. Great for teamwork and automation!
