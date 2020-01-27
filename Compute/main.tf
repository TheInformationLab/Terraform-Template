resource "aws_instance" "alteryx-testing" {
    name = "${var.server_name}"
  # Ubuntu Server 18.04 LTS (HVM), SSD Volume Type in us-east-2
  ami                     = "ami-0c55b159cbfafe1f0"
  instance_type           = "t2.micro"
  vpc_security_group_ids  = [aws_security_group.instance.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p "${var.server_port}" &
              EOF

  tags = {
    Name = "terraform-alteryx-testing"
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# APPLY THE SECURITY GROUP THAT'S CREATED IN THE NETWORK MODULE AND APPLIED TO THE EC2 INSTANCE
# ---------------------------------------------------------------------------------------------------------------------

module "ayx_public_sg" {
  source = "../networking" 
}

resource "aws_security_group" "instance" {
  name = "terraform-example-instance"

  # Inbound HTTP from anywhere
  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags {
      Name = "alteryx-testing"
  }
}