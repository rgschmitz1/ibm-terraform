# Purpose

Document infrastructure as code (IaC) used to automate IBM cloud VPC instance deployment

# Dependencies

* IBM cli
* Terraform cli

# Setup

Create a file called ***terraform.tfvars*** with the following content. Note to create an API key see, https://cloud.ibm.com/docs/account?topic=account-userapikey&interface=ui#create_user_key

```
ibmcloud_api_key = "<ibmcloud_api_key>"
region = "<region>"
```

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
