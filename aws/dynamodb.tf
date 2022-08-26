resource "aws_dynamodb_table" "employee" {
  name = "employee"
  hash_key = "emp_id"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "emp_id"
    type = "N"
  }
  tags = {
    "name" = "employee-data"
  }
}
resource "aws_dynamodb_table_item" "employee" {
  table_name = aws_dynamodb_table.employee.name
  hash_key = aws_dynamodb_table.employee.hash_key
  item = <<ITEM
  {
    "emp_id": {"N": "1"},
    "name": {"S": "Mary"},
    "age": {"N": "25"},
    "role": {"S": "Manager"}
  }
ITEM
}

#or

resource "aws_dynamodb_table" "staff" {
  name = "staff"
  hash_key = "emp_id"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "emp_id"
    type = "N"
  }
}

locals {
  json_data = file("employee.json")
  tf_data = jsondecode(local.json_data)
}

resource "aws_dynamodb_table_item" "staff" {
  table_name = aws_dynamodb_table.staff.name
  hash_key = aws_dynamodb_table.staff.hash_key
  for_each = local.tf_data
  item = jsonencode(each.value)

}