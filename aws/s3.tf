resource "aws_s3_bucket" "main" {
  bucket = "newfavourbucket"
  tags = {
    Description = "My new terraform bucket"
  }
}
resource "aws_s3_bucket_object" "main-1" {
  source = "~/downloads/resumes.pdf"
  key = "resumes.pdf"
  bucket = aws_s3_bucket.main.id
}
#data "aws_iam_group" "main-data" {
#  group_name = "developers"
#}

resource "aws_s3_bucket_policy" "main-policy" {
  bucket = aws_s3_bucket.main.id
  policy = <<EOF
  {
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "*",
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::${aws_s3_bucket.main.id}/*",
      "Principal": {
        "AWS": [
             "arn:aws:iam::428253719401:root"
        ]
      }
    }
  ]
}
EOF
}

resource "aws_s3_bucket_public_access_block" "block_public_access" {
  bucket = aws_s3_bucket.main.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


#${aws_iam_group.developers.arn}
#arn:aws:iam::428253719401:group/developers/developers