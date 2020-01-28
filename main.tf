
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DEPLOY A SINGLE EC2 INSTANCE
# This template runs a simple "Hello, World" web server on a single EC2 Instance
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ------------------------------------------------------------------------------
# CONFIGURE OUR AWS CONNECTION
# ------------------------------------------------------------------------------

provider "aws" {
  region = "us-east-2"
}

# ---------------------------------------------------------------------------------------------------------------------
# ADD NETWORKING FROM MODULE
# ---------------------------------------------------------------------------------------------------------------------

module "networking" {
  source                = "./networking"
  # VPC_CIDR              = var.VPC_CIDR
  # PRIVATE_CIDRS         = var.PRIVATE_CIDRS
  # ALLACCESSIPS          = var.ALLACCESSIPS
  # ALLOWEDIPS            = var.ALLOWEDIPS
  # AWS_AVAILABILITY_ZONE = var.AWS_AVAILABILITY_ZONE
} 

# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY A SINGLE EC2 INSTANCE
# ---------------------------------------------------------------------------------------------------------------------

# module "compute" {
#   source = "./compute"
#   server_port = 80
# }

resource "aws_instance" "example" {
  # Ubuntu Server 18.04 LTS (HVM), SSD Volume Type in us-east-2
  ami                     = "ami-0c55b159cbfafe1f0"
  instance_type           = "t2.micro"
  vpc_security_group_ids  = [aws_security_group.ayx_public_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p "${var.server_port}" &
              EOF

  tags = {
    Name = "terraform-example"
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE THE SECURITY GROUP THAT'S APPLIED TO THE EC2 INSTANCE
# ---------------------------------------------------------------------------------------------------------------------

# resource "aws_security_group" "instance" {
#   name = "terraform-example-instance"

#   # Inbound HTTP from anywhere
#   ingress {
#     from_port   = var.server_port
#     to_port     = var.server_port
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }
