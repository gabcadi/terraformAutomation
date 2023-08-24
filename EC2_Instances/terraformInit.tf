provider "aws" {
  region = var.region # Se intercambia por la región en la que tengamos ubicada nuestra cuenta
}
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

resource "aws_key_pair" "mykey" {
  key_name   = "mykey"
  public_key = file("~/.ssh/id_rsa.pub") # Se ubica la dirección de nuestra SSH
}

resource "aws_instance" "app_server" {
  ami                    = "ami-024e6efaf93d85776"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.mykey.key_name
  count                  = 1 # Genera el número de instancias que se deseen
  vpc_security_group_ids = [aws_security_group.proyectoSG.id]

  tags = {
    Name = var.instance_name # Indicamos el nombre de nuestra instancia o bien podemos crear una en el archivo de variables
  }
  user_data = var.ec2_user_data
}

resource "aws_security_group" "proyectoSG" {
  name        = "EC2_console"
  description = "Allow inbound traffic"
  tags = {
    Name = "SecurityGroup"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
