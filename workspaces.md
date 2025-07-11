
# ✅ Terraform Workspaces - Explained with Demo

Terraform workspaces allow you to manage multiple states (like dev, staging, prod) within the same configuration directory without duplicating code.

## 🔍 What Are Workspaces?

- By default, Terraform uses the `default` workspace.
- Each workspace maintains its own **state file**.
- They help when managing multiple environments (e.g., dev, stage, prod) using the same codebase.

## 🧠 Why Use Workspaces?

| Problem                                              | Solution via Workspaces                        |
|------------------------------------------------------|------------------------------------------------|
| Managing dev, staging, prod infrastructure           | Use separate workspaces                        |
| Avoiding overwriting state                           | Isolate state using workspaces                 |
| Cost savings by tearing down dev workspace but keeping prod | Workspaces let you manage environments independently |

## 📦 How to Use Terraform Workspaces?

### 1. Initialize Terraform

```bash
terraform init
```

### 2. Create a New Workspace

```bash
terraform workspace new dev
terraform workspace new prod
```

### 3. Switch Between Workspaces

```bash
terraform workspace select dev
terraform workspace select prod
```

### 4. Check Current Workspace

```bash
terraform workspace show
```

### 5. Use the Workspace Name in Your Configuration (Optional)

```hcl
resource "aws_s3_bucket" "example" {
  bucket = "my-bucket-${terraform.workspace}"
  acl    = "private"
}
```

This creates different buckets like:

- `my-bucket-dev`
- `my-bucket-prod`

## 🔥 Example Workflow

```bash
terraform workspace new dev
terraform apply
# deploys resources for dev

terraform workspace new prod
terraform apply
# deploys resources for prod
```

Each workspace has its own `terraform.tfstate`, so dev and prod resources are isolated.

## ❗ Best Practices

- Use workspaces for **environment-level** separation, not for **tenant-level** (for multi-tenancy, prefer folder-based structure or modules).
- Avoid naming resources identically in all workspaces unless the provider supports this.

## 🧹 Deleting a Workspace

```bash
terraform workspace select default
terraform workspace delete dev
```

> You can't delete the workspace you're currently in.
