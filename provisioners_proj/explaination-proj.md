
# 📄 Terraform EC2 Deployment with Flask App (Using Provisioners)

## Overview

This Terraform configuration:

- Creates a **VPC**, **subnet**, **internet gateway**, and **route table**
- Launches an **EC2 instance**
- Uses **file** and **remote-exec provisioners** to deploy a **Flask app**
- Sets up **key-pair-based SSH access** and **security groups**

---

## 🔧 What Each Resource Does

### 1. **Provider Block**
```hcl
provider "aws" {
  region = "us-east-1"
}
```
This tells Terraform to use AWS services in the **us-east-1** region.

---

### 2. **Variable for CIDR Block**
```hcl
variable "cidr" {
  default = "10.0.0.0/16"
}
```
Defines a CIDR block range used in the VPC.

---

### 3. **Key Pair**
```hcl
resource "aws_key_pair" "example" {
  key_name   = "terraform-demo-abhi"
  public_key = file("~/.ssh/id_rsa.pub")
}
```
Registers your public key with AWS so you can SSH into your instance.

---

### 4. **VPC and Subnet**
```hcl
resource "aws_vpc" "myvpc" {...}
resource "aws_subnet" "sub1" {...}
```
Creates a VPC and a public subnet with internet access.

---

### 5. **Internet Gateway and Routing**
```hcl
resource "aws_internet_gateway" "igw" {...}
resource "aws_route_table" "RT" {...}
resource "aws_route_table_association" "rta1" {...}
```
- IGW enables internet access
- Routing table allows public access
- Associated with the public subnet

---

### 6. **Security Group**
```hcl
resource "aws_security_group" "webSg" {...}
```
Allows:
- **Port 22** (SSH)
- **Port 80** (HTTP)
- All outbound traffic

---

### 7. **EC2 Instance**
```hcl
resource "aws_instance" "server" {...}
```
- Uses the registered key
- Uses the subnet and security group
- Pulls your SSH private key to connect and configure it via provisioners

---

### 8. **Provisioners**

#### File Provisioner
```hcl
  provisioner "file" {
    source = "app.py"
    destination = "/home/ubuntu/app.py"
  }
```
Copies `app.py` from your machine to the EC2 instance.

#### Remote-Exec Provisioner
```hcl
  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt-get install -y python3-pip",
      "sudo pip3 install flask",
      "sudo python3 app.py &"
    ]
  }
```
Runs commands to install Flask and start your app inside the EC2 instance.

---

## ✅ Result

Once applied, Terraform will:
- Create infrastructure
- Launch an EC2 instance
- Deploy your Python Flask app
