provider "aws" {
  region     = var.AWS_REGION
}

module "networking" {
  source                = "./networking"
  VPC_CIDR              = var.VPC_CIDR
  PRIVATE_CIDRS         = var.PRIVATE_CIDRS
  ALLACCESSIPS          = var.ALLACCESSIPS
  ALLOWEDIPS            = var.ALLOWEDIPS
  AWS_AVAILABILITY_ZONE = var.AWS_AVAILABILITY_ZONE
}

data "aws_s3_bucket_object" "secret_key" {
  bucket = var.S3_KEY_BUCKET
  key    = var.S3_KEY_NAME_LOCATION
}

resource "aws_instance" "server" {
  ami                      = var.AMIS[var.AWS_REGION]
  instance_type            = var.AWS_INSTANCE
  vpc_security_group_ids  = [module.networking.security_group_id_out]
  subnet_id               = module.networking.subnet_id_out

  ## Use this count key to determine how many servers you want to create.
  count                   = 1
  key_name                = var.KEY_NAME
  tags = {
    # Name                  = "Server-Cloud"
    Name = "Ayx-Server-${count.index}"
  }

  root_block_device {
    volume_size           = var.VOLUME_SIZE
    volume_type           = var.VOLUME_TYPE
    delete_on_termination = true
  }

  get_password_data = true

  provisioner "remote-exec" {
    connection {
      host = coalesce(self.public_ip, self.private_ip)
      type = "winrm"

      ## Need to provide your own .pem key that can be created in AWS or on your machine for each provisioned EC2.
      password = rsadecrypt(self.password_data, "${data.aws_s3_bucket_object.secret_key.body}")
    }
    inline = [
      "powershell -ExecutionPolicy Unrestricted C:\\Users\\Administrator\\Desktop\\installserver.ps1 -Schedule",
    ]
  }

  # provisioner "local-exec" {
  #   command = "echo ${self.public_ip} >> ../public_ips.txt"
  # }
}
