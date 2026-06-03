variable "aws_region" {
  default = "us-east-1"
}

variable "key_name" {
  description = "Name of your AWS key pair"
  type        = string
}

variable "your_ip" {
  description = "Your public IP for SSH access (x.x.x.x/32)"
  type        = string
}