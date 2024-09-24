resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = var.bucket_name  # Referencing the variable defined in terraform.tfvars
  acl    = "private"

  tags = {
    Name = "TerraformStateBucket"
  }
}
