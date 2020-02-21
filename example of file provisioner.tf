# TODO: example of file provisioner for downloading from s3 bucket
# data "aws_s3_bucket_object" "secret_key" {
#   bucket = "awesomecorp-secret-keys"
#   key    = "awesomeapp-secret-key"
# }

# resource "aws_instance" "example" {
#   ## ...

#   provisioner "file" {
#     content = "${data.aws_s3_bucket_object.secret_key.body}"
#   }
# }


# TODO: Consider if the default password is required for remote access in the scripted process. Should this be manually accessed 
#output "ec2_password" {
#    provisioner "local-exec" {
#     command = "echo ${aws_instance.web.private_ip} >> private_ips.txt"
#   }
#   ## Need to provide your own .pem key that can be created in AWS or on your machine for each provisioned EC2.
#   value = rsadecrypt(aws_instance.server[0].password_data,  "${data.aws_s3_bucket_object.secret_key.body}")
# }