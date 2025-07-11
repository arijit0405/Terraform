
# 🛠️ Step-by-Step: Migrating Existing Infrastructure to Terraform

## ✅ 1. Identify Existing Resources
List the resources you want to bring under Terraform's control. For example:

- EC2 instances
- Security Groups
- S3 buckets
- RDS databases
- IAM roles/policies
- VPCs/Subnets

## ✅ 2. Write Terraform Configuration Stubs
For each resource, write a minimal resource block with the correct type and name.

```hcl
resource "aws_instance" "my_app" {
  # temporarily empty
}
```

## ✅ 3. Use terraform import to Import Each Resource
Syntax:

```bash
terraform import <resource_type>.<name> <resource_id>
```

Example:

```bash
terraform import aws_instance.my_app i-0abcd1234567890
```

This links the actual AWS resource with your Terraform config and stores the mapping in `terraform.tfstate`.

## ✅ 4. Run terraform plan to See What’s Missing
Terraform will compare:

- Your empty `.tf` config
- The real cloud resource
- The state file

You’ll see a diff showing what's expected but missing in `.tf`.

## ✅ 5. Update Your Terraform Files to Match the Actual Resource
Fill in the `.tf` file to match the real resource as closely as possible.

```hcl
resource "aws_instance" "my_app" {
  ami           = "ami-0abc12345def67890"
  instance_type = "t2.micro"
  subnet_id     = "subnet-0a1b2c3d"
  tags = {
    Name = "MyApp"
  }
}
```

Run:

```bash
terraform plan
```

When it shows:

✅ No changes. Infrastructure is up-to-date.

... you're good.

## ✅ 6. Repeat for All Resources
Import all resources one by one and update their `.tf` definitions.

## ✅ 7. Refactor and Modularize
Once all resources are under control, you can:

- Move configs into modules
- Extract values into variables
- Add outputs
- Add backend (e.g., S3 state)

## 🔐 Bonus: Remote State
To enable collaboration, configure remote state (e.g., S3 + DynamoDB for AWS) instead of keeping `.tfstate` locally.

## ⚠️ Gotchas

| Issue                              | Solution                             |
|------------------------------------|--------------------------------------|
| Configuration doesn’t match after import | Update your `.tf` to reflect reality |
| Forgetting a required argument     | Check `terraform plan` output        |
| `terraform import` does not generate config | You must write `.tf` manually        |
| Missing dependencies               | Import dependent resources first (e.g., VPC before subnet) |

## 📌 Final Directory Layout (Sample)

```text
terraform/
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfstate
```
