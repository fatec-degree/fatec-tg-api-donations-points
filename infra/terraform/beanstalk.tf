resource "aws_elastic_beanstalk_application" "api_donations_beanstalk" {
  name        = "api-donations-tf"
  description = "API for FATEC's TG"
}

resource "aws_elastic_beanstalk_application_version" "api_donations_version" {
  name        = "api-donations-1.0"
  application = aws_elastic_beanstalk_application.api_donations_beanstalk.name
  bucket      = aws_s3_bucket.api_donations_s3.id
  key         = aws_s3_object.api_donations_jar.id
}

resource "aws_elastic_beanstalk_environment" "api_donations_prd" {
  name                = "api-donations-prd"
  application         = aws_elastic_beanstalk_application.api_donations_beanstalk.name
  version_label       = aws_elastic_beanstalk_application_version.api_donations_version.name
  solution_stack_name = "64bit Amazon Linux 2 v3.4.2 running Corretto 17"

  setting {
    namespace = "aws:ec2:instances"
    name      = "InstanceTypes"
    value     = "t2.micro"
  }

  setting {
   namespace = "aws:autoscaling:launchconfiguration"
   name = "IamInstanceProfile"
   value = "aws-elasticbeanstalk-ec2-role"
  }
}
