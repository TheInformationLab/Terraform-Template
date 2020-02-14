output "public_ip" {
  value       = aws_instance.server.*.public_ip
  description = "The public IP of the web server"
}

output "public_dns" {
  value       = aws_instance.server.*.public_dns
  description = "The public IP of the web server"
}
# TODO: Consider if the default password is required for remote access in the scripted process. Should this be manually accessed 
# output "ec2_password" {
  #  provisioner "local-exec" {
  #   command = "echo ${aws_instance.web.private_ip} >> private_ips.txt"
  # }

#   # ## Need to provide your own .pem key that can be created in AWS or on your machine for each provisioned EC2.
#   # value =  [
#   #    for g in aws_instance.server : rsadecrypt(g.password_data, "${data.aws_s3_bucket_object.secret_key.body}")
#   #  ]
#   value = rsadecrypt(aws_instance.server.*.password_data, "${data.aws_s3_bucket_object.secret_key.body}")
# }

# output "windows_password" {
#   value       = aws_instance.server.*.password_data
#   description = "Encrypted windows password"
# }