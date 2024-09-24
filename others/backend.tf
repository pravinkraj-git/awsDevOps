terraform {
  backend "s3" {
    bucket         = var.bucket_name
    key            = "global/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = var.table_name
  }
}
