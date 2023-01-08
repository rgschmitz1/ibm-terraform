# Purpose

Document infrastructure as code (IaC) used to automate IBM cloud VPC instance deployment

# Dependencies

* Terraform cli
* IBM cli

# Setup

Install necessary terraform modules using, this only needs to be done once.
```
terraform init
```

Use the following to configure environment variables, this can be filled in manually using defaults also
```
terraform plan
```

# Deploy infrastructure

```
terraform apply
```

# Teardown infrastructure

```
terraform destroy
```
