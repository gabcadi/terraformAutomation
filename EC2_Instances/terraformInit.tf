provider "aws" {
  region = "AWS_REGION" # Se intercambia por la región en la que tengamos ubicada nuestra cuenta
}

resource "aws_key_pair" "mykey" {
  key_name   = "mykey" 
  public_key = file("mykey.pub") # Se ubica la dirección de nuestra SSH
}

resource "aws_instance" "app_server" {
  ami           = "ami-024e6efaf93d85776"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.mykey.key_name
  count = 1 # Genera el número de instancias que quiero

  tags = {
    Name = "ProyectoFinal" # Indicamos el nombre de nuestra instancia 
  }
}
