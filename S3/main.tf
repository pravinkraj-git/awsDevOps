provider "aws" {
<<<<<<< HEAD
<<<<<<< HEAD
  region = "ap-south-1"  # Specify the AWS region where you want to create the bucket
  alias = "primary"
  region = "eu-west-2"  # Specify the AWS region where you want to create the bucket
}

provider "aws" {
  alias = "secondary"
  region = "eu-west-2"  # Specify the AWS region where you want to create the bucket
>>>>>>> 3ed8b56 (alias included primary and secondary)
=======
  region = "eu-west-2"  # Specify the AWS region where you want to create the bucket
>>>>>>> 67cdc1b (Revert "region ap_south_1 added")
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = "my-unique-bucket-name"  # Replace with your unique bucket name

  tags = {
    Name        = "MyBucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "example_bucket_acl" {
  bucket = aws_s3_bucket.example_bucket.bucket
  acl    = "private"
}
