resource "aws_s3_bucket" "api_donations_s3" {
  bucket = "api-donations-s3"
  depends_on = [
    aws_db_instance.api_donations_rds
  ]
  force_destroy = true
  tags = {
    Name = "API Donations S3"
  }
}

resource "aws_s3_bucket_ownership_controls" "ownership_controls_s3" {
  bucket = aws_s3_bucket.api_donations_s3.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "github_actions_acl" {
  bucket = aws_s3_bucket.api_donations_s3.id
  acl    = "private"
  depends_on = [
    aws_s3_bucket_ownership_controls.ownership_controls_s3
  ]
}
