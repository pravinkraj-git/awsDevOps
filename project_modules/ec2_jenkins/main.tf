provider "aws" {
  region = "eu-west-2"
}

resource "aws_security_group" "jenkins_sg" {
  name        = "jenkins-sg"
  description = "Allow SSH from bastion and HTTP traffic for Jenkins"

  ingress {
    from_port   = 0 # SSH port
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "jenkins_server" {
  ami           = "ami-0b45ae66668865cd6"
  instance_type = "t2.micro"
  key_name      = "pem_key_name"
  security_groups = [aws_security_group.jenkins_sg.name]

  tags = {
    Name = "Jenkins-Server"
  }
}

resource "null_resource" "empty" {

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("C:/Users/uername/perm_key_name")
    host        = aws_instance.jenkins_server.public_ip
  }

  # Use provisioners to copy and execute the script
  provisioner "file" {
    source      = "jenkins_install.sh"  # Your script stored locally
    destination = "/tmp/jenkins_install.sh"
  }
  
  provisioner "remote-exec" {
    inline = [
      "sudo dos2unix /tmp/jenkins_install.sh",
      "sudo chmod +x /tmp/jenkins_install.sh",
      "sudo sh /tmp/jenkins_install.sh"
    ]
  }

  depends_on = [aws_instance.jenkins_server]

}

output "jenkins_url" {
  value = join("", ["http://", aws_instance.jenkins_server.public_ip, ":", "8080"])
}
