#-----networking/main.tf
# Create a data resource
data "aws_availability_zones" "available" {
}

# Overall Networking Schema
resource "aws_vpc" "ayx_vpc" {
  cidr_block           = var.VPC_CIDR
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "ayx_vpc"
  }
}

# Securing the environment
resource "aws_security_group" "ayx_public_sg" {
  name        = "ayx_public_sg"
  description = "Used for access to the public instances"
  vpc_id      = aws_vpc.ayx_vpc.id

  # Inbound HTTP from anywhere
  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


