resource "aws_dynamodb_table" "backend" {
  name = "backend"
  hash_key = "LockID"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "LockID"
    type = "S"
  }
}

resource "aws_s3_bucket" "backend" {
  bucket = "backnd-bcket"
  tags = {
    Description = "My new backend bucket"
  }
}