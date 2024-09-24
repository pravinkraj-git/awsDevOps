provider "aws" {
  region = "us-west-2"
}

resource "aws_dynamodb_table" "" {
  name         = "my-dynamodb-table"
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "id"

  attribute {
    name = "id"
    type = "S"
  }

  tags = {
    Name        = "MyDynamoDBTable"
    Environment = "Dev"
  }
}