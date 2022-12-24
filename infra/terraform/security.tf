resource "aws_security_group" "api_donations_sg" {
  name        = "api-donations-sg"
  description = "API Donations Security Group"
  vpc_id      = aws_vpc.api_donations_vpc.id

  tags = {
    "Name" = "api-donations-sg"
  }
}

resource "aws_security_group_rule" "public_out" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.api_donations_sg.id
}

resource "aws_security_group_rule" "public_in_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.api_donations_sg.id
}

resource "aws_security_group" "api_donations_db_sg" {
  name        = "api-donations-db-sg"
  description = "API Donations Security Group"
  vpc_id      = aws_vpc.api_donations_vpc.id

  tags = {
    "Name" = "api-donations-db-sg"
  }
}

resource "aws_security_group_rule" "connect_db" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.api_donations_db_sg.id
}
