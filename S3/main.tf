provider "aws" {
  region = "ap-south-1"  # Specify the AWS region where you want to create the bucket
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
