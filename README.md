# Terraform: Documentation Steps
================================

This documentation is here to assist you with populating the information required to run the Terraform binary for creating a provisioned Server instance.


#### Variables file (terraform.tfvars)
|Name  |Type  |Default|Description|
|------|------|-------|-----------|
|ALLACCESSIPS|String|`0.0.0.0/0`|Do not change the variabe below. Change only if you really want too.|
|ALLOWEDIPS|String|`""`|Change these IP's for your Private network.|
|AWS_ACCESS_KEY|String|`""`|Add your AWS Access Key here.|
|AWS_INSTANCE|String|`m5.xlarge`|This is the minimum System Requirements for the AWS Instance type.|
|AWS_SECRET_KEY|String|`""`|Add your AWS Secret Key here.|
|KEY_NAME|String|`""`|Needs to match an existing SSH Key name in your AWS account (No Need for .pem extension).|
|KEY_PATH|String|`""`|Path to the PEM key on your local machine.|
|PRIVATE_CIDRS|String|`""`|Private CIDR block for the Promote instances (Change as you see fit).|
|VOLUME_SIZE|String|`""`|Minimum System Requirement for the Volume (100 gb) (Change as you see fit with a higher Volume size).|
|VPC_CIDR|String|`""`|VPC CIDR (Change as you see fit).|


## Current Manual Settings
================================

In the current configuration a number of settings are required to be manually set.
Global terraform.tfvars. needs to be manually entered into the Terraform Vars web interface.

[+] The SSH key for securing the instance needs to be manually created and saved into an S3 bucket. That bucket and then needs to be provided

### In the main [vars file](.\vars.tf)
[+] The AMI is manually set. this needs to be created from a packer script process in the target region then copied into the vars
