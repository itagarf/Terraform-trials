#Prerequisites:
#s3 bucket to store terraform state file
#Dynamodb to store to implement state locking and consistency checks

terraform {
  backend "s3" {
    bucket = "backnd-bket"
    key = "backend/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "backnd"
  }
}