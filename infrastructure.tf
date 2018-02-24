provider "aws" {
  region     = "us-east-1"
}

resource "aws_instance" "jenkins" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"

  provisioner "local-exec" {
    command = "echo ${aws_instance.jenkins.public_ip} > ip_address.txt"
  }
  
}