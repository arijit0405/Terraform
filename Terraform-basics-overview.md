# 🌍 Terraform Overview

## 📌 What is Terraform?
Terraform is an **open-source Infrastructure as Code (IaC) tool** developed by HashiCorp. It allows you to define, provision, and manage cloud infrastructure using declarative configuration files.

---

## 🧱 Key Concepts

### 1. Providers
Providers are responsible for managing the lifecycle of resources (e.g., AWS, Azure, GCP, Kubernetes).
```hcl
provider "aws" {
  region = "us-east-1"
}
```

### 2. Resources
Resources are the infrastructure components you want to manage.
```hcl
resource "aws_instance" "example" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"
}
```

### 3. Variables
Variables allow parameterization of configurations.
```hcl
variable "instance_type" {
  default = "t2.micro"
}
```

### 4. Outputs
Outputs display information after execution.
```hcl
output "instance_id" {
  value = aws_instance.example.id
}
```

### 5. State File
Terraform stores infrastructure state in a local file (`terraform.tfstate`) or remote backends like S3.

---

## 🔁 Terraform Workflow

1. `terraform init` – Initialize Terraform working directory.
2. `terraform plan` – Show execution plan.
3. `terraform apply` – Apply the changes required.
4. `terraform destroy` – Tear down infrastructure.

---

## 📦 File Structure

- `main.tf` – Main configuration file.
- `variables.tf` – Variables used in the configuration.
- `outputs.tf` – Output values.
- `terraform.tfvars` – Variable values.
- `provider.tf` – Provider-specific configuration.

---

## ☁️ Supported Providers

- AWS
- Azure
- Google Cloud Platform (GCP)
- Kubernetes
- GitHub
- Many others

---

## 🔐 Remote Backends (State Storage)

- S3 + DynamoDB (for locking)
- Azure Blob Storage
- GCS (Google Cloud Storage)
- Terraform Cloud

---

## 🎯 Use Cases

- Deploying AWS EC2, S3, VPCs
- Automating Kubernetes infrastructure
- Managing GitHub repos
- Building scalable and version-controlled infra

---

## 🛡️ Best Practices

- Use `terraform fmt` and `terraform validate`
- Store remote state securely
- Use workspaces or modules for multiple environments
- Don’t store secrets in plain text

---

## 📅 Last Updated
July 09, 2025
