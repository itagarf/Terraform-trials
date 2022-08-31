resource "aws_dynamodb_table" "backnd" {
  name = "backnd"
  hash_key = "LockID"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "LockID"
    type = "S"
  }
}

resource "aws_s3_bucket" "backnd" {
  bucket = "backnd-bket"
  tags = {
    Description = "My new backend bucket"
  }
}