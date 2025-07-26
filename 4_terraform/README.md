# Lab 4: Terraform Basics

In this lab, you will learn how to:

- setup terraform project
- work with standard terraform providers (random, local, aws)
- read information AWS using terraform
- upload files to S3 using terraform



## Task - Part 1 (Install Terraform)


1. Install Terraform CLI - https://developer.hashicorp.com/terraform/install
2. Verify that `terraform` installed by running `terraform version`. (Output example: `Terraform v1.5.7`)

Example: 
```
> terraform version

Terraform v1.12.2
on darwin_arm64
```

3. Run `terraform init` 

Expect message “Terraform has been successfully initialized!”


4. Run `terraform apply`

Expect message “No changes. Your infrastructure matches the configuration.”


5. Open this folder
6. observe file `terraform.tfstate` (this is your state file)
7. Create file `main.tf` and add the following:

```
resource "random_password" "admin_password" {
  length = 24
  special = true
}

resource "local_file" "credentials" {
  filename = "./admin_credentials.json"
  content = jsonencode({
    username: "admin",
    password: random_password.admin_password.result
  })
}
```
8. Run `terraform init` again 

to install new providers - “hashicorp/random” and “hashcorp/local”

9. Run `terraform apply`

Expect two changes -> “Plan: 2 to add, 0 to change, 0 to destroy.”

Confirm by typing `yes`

10. Find file `admin_credentials.json` in the current folder.

## Task - Part 2 (Terraform + AWS)

[!!!] You must complete Lab 3 (AWS) before moving to this part

11. Open `main.tf` file and add the following:

```hcl
data "aws_region" "current" {}
data "aws_caller_identity" "current" {}
data "aws_s3_bucket" "main" {
  bucket = "devops-labs-private"
}

resource "random_string" "file_name" {
  length = 8
  special = false
}

resource "aws_s3_object" "main" {
  bucket = data.aws_s3_bucket.main.id
  key = "${random_string.file_name.result}.json"
  content = jsonencode({
    aws_region = data.aws_region.current.name,
    aws_user = data.aws_caller_identity.current.user_id,
    aws_bucket = data.aws_s3_bucket.main.id
    file_name = random_string.file_name.result
  })
}

output "file_console_link" {
  value = "https://${data.aws_region.current.name}.console.aws.amazon.com/s3/object/${data.aws_s3_bucket.main.id}?region=${data.aws_region.current.name}&bucketType=general&prefix{aws_s3_object.main.key}"
  description = "Link to the file in console"
}
```


Run `terraform init` again

to install new providers - “hashicorp/aws”

24. Run `terraform apply`

Expect two changes -> “Plan: 2 to add, 0 to change, 0 to destroy.”

Confirm by typing `yes`. Expec the output
 
```

random_string.file_name: Creating...
random_string.file_name: Creation complete after 0s [id=3MXqahHX]
aws_s3_object.main: Creating...
aws_s3_object.main: Creation complete after 1s [id=devops-lab-private/3MXqahHX.json]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.


Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

Outputs:

file_console_link = "https://..."
```

25. Open the link and download file to inspect
26. Restart terraform apply, make sure no changes expected/made 
