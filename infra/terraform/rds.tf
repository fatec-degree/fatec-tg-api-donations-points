resource "aws_db_instance" "api_donations_rds" {
  identifier                 = "db-donations"
  db_name                    = "db_donations"
  engine                     = "mysql"
  engine_version             = "8.0.31"
  instance_class             = "db.t2.micro"
  username                   = var.DATABASE_USER
  password                   = var.DATABASE_PASSWORD
  parameter_group_name       = "default.mysql5.7"
  skip_final_snapshot        = true
  allocated_storage          = 20
  max_allocated_storage      = 0
  apply_immediately          = true
  multi_az                   = false
  port                       = 3306
  auto_minor_version_upgrade = false
}
