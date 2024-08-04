provider "aws" {
  region = "eu-south-1"  # Specify the AWS region
}

resource "aws_instance" "test_instance" {
  ami           = "ami-057084464718466ff"  # Replace with a valid AMI ID for your region
  instance_type = "t2.micro"  # Instance type

  tags = {
    Name = "learning_instance"
  }
}
