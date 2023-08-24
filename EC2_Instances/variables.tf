variable "instance_name" {
  description = "ProyectoFinal"
  type        = string
  default     = "Mi primera instancia"
}

variable "region" {
  description = "Region"
  type        = string
  default     = "us-east-2"
}

variable "key_pair" {
  description = "Key Pair"
  type        = string
  default     = "keypair1"
}

variable "ec2_user_data" {
  description = "value"
  type        = string
  default     = <<EOF
    #!/bin/bash
    sudo amazon-linux-extras install docker -y
    sudo service docker start
    sudo apt install docker.io
    sudo apt install podman-docker
    sudo wget https://go.dev/dl/go1.20.2.linux-amd64.tar.gz
    sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.20.2.linux-amd64.tar.gz
    EOF
}
