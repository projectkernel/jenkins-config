provider "aws" {
  region     = "us-east-1"
}

resource "aws_key_pair" "jenkins" {
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}

resource "aws_instance" "jenkins" {
  ami           = "ami-66506c1c"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.jenkins.key_name}"

  tags {
    Name = "jenkins"
  }

  connection {
    type     = "ssh"
    private_key = "${file("~/.ssh/id_rsa")}"
    user     = "ubuntu"
    timeout  = "2m"
  }

}

output "public_ip" {
  value = "${aws_instance.jenkins.public_ip}"
}