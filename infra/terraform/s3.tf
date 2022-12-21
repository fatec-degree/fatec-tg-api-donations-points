resource "aws_s3_bucket" "api_donations_s3" {
  bucket = "api-donations-s3"

  tags = {
    Name = "API Donations S3"
  }
}

resource "aws_s3_object" "api_donations_jar" {
  bucket = aws_s3_bucket.api_donations_s3.id
  key    = "api-donations/donations-0.0.1-SNAPSHOT.jar"
  source = "../../target/donations-0.0.1-SNAPSHOT.jar"
}

resource "aws_s3_bucket_acl" "github_actions_acl" {
  bucket = aws_s3_bucket.api_donations_s3.id
  acl    = "private"
}
