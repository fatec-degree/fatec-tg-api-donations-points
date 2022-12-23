resource "aws_s3_bucket" "api_donations_s3" {
  bucket = "api-donations-s3"

  tags = {
    Name = "API Donations S3"
  }
}

resource "aws_s3_bucket_acl" "github_actions_acl" {
  bucket = aws_s3_bucket.api_donations_s3.id
  acl    = "private"
}
