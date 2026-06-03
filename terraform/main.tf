provider "aws" {
  region = var.aws_region
}

#security group
resource "aws_security_group" "minecraft_sg" {
  name        = "minecraft-sg"
  description = "Allow Minecraft and SSH"

  ingress {
    description = "Minecraft"
    from_port   = 25565
    to_port     = 25565
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH from my IP only"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.your_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#EC2 instance
resource "aws_instance" "minecraft" {
  ami                    = "ami-0c02fb55956c7d316"
  instance_type          = "t2.medium"
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.minecraft_sg.id]

  tags = {
    Name = "minecraft-server"
  }
}