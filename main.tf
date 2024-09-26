resource "aws_db_instance" "foodway_postegres_instance" {
  identifier             = "foodway-postegres-instance"
  allocated_storage      = 20
  engine                 = "postgres"
  instance_class         = "db.t3.micro"
  db_name                = "foodway"
  username               = var.foodway_db_user
  password               = var.foodway_db_password
  publicly_accessible    = false
  vpc_security_group_ids = [aws_security_group.postgres_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.postgres_subnet_group.name
  skip_final_snapshot    = true
}

resource "aws_db_subnet_group" "postgres_subnet_group" {
  name = "postgres-subnet-group"
  subnet_ids = [
    data.aws_subnet.private_subnet_1.id,
    data.aws_subnet.private_subnet_2.id
  ]
}

resource "aws_security_group" "postgres_sg" {
  name        = "allow-postgres"
  description = "Allow PostgreSQL inbound traffic"
  vpc_id      = data.aws_vpc.base_vpc.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
