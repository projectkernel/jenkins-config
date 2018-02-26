provider "aws" {
  region     = "us-east-1"
}

resource "aws_key_pair" "jenkins" {
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}

resource "aws_security_group" "allow_all" {
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "jenkins" {
  ami           = "ami-66506c1c"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.jenkins.key_name}"
  vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]

  tags {
    Name = "jenkins"
  }

  connection {
    type     = "ssh"
    private_key = "${file("~/.ssh/id_rsa")}"
    user     = "ubuntu"
    timeout  = "2m"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get install python -y"
    ]
  }
}