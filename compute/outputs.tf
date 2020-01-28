output "server_name" {
  value       = aws_instance.alteryx-testing.{var.server_name}
  description = "The public IP of the web server"
}
