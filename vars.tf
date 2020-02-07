variable "ALLACCESSIPS" {
  description = "IPs allowed full access to environment"
  type = list(string)
}

variable "ALLOWEDIPS" {
  description = "IPs allowed full access to private areas environment"
  type = list(string)
}

variable "AMIS" {
  type = map(string)
  default = {
    #FIXME: currently set to manually created ami with alteryx server installed for testing.
    #TODO: develop packer script to create base image and deploy into tf script
    us-west-2 = "ami-0fb9f7b851eccc376"
  }
}

variable "AWS_INSTANCE" {
  description = "Instance for server to run on. Minimum System Requirements for the AWS Instance type is m4.xlarge" 
}

variable "AWS_REGION" {
  default = "us-west-2"
}

variable "KEY_NAME" {
  default = "TIL-USWest2"
}

variable "KEY_PATH" {
  default = "s3://alteryx-cf-installer/keys/TIL-USWest2.pem"
}

variable "S3_KEY_BUCKET" {
  description = "Name of bucket where ssh key is located"
}

variable "S3_KEY_NAME_LOCATION" {
  description = "Name of ssh key file on S3"
}

variable "PRIVATE_CIDRS" {
}

variable "VOLUME_SIZE" {
}

variable "VOLUME_TYPE" {
  default = "gp2"
}

variable "VPC_CIDR" {
}

variable "AWS_AVAILABILITY_ZONE" {
  default = "us-west-2b"
}

variable "admin_password" {
  default = "SuperStar!"
}

# # Required for local development.
# variable "AWS_ACCESS_KEY_ID" {
# }

# variable "AWS_SECRET_ACCESS_KEY" {
# }
