#-----networking/vars.tf
variable "VPC_CIDR" {
}

variable "PRIVATE_CIDRS" {
}

variable "ALLACCESSIPS" {
  type = list(string)
}

variable "ALLOWEDIPS" {
}

variable "AWS_AVAILABILITY_ZONE" {
}

