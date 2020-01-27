
variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 80
}

variable "server_name" {
  description = "name of the server"
  type = string
  default = "windows-server"
}
