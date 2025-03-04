resource "aws_db_instance" "database" {
  allocated_storage    = var.allocated_storage
  engine               = var.engine
  instance_class       = var.instance_class
  db_name              = var.db_name
  username             = var.username
  password             = var.password
  multi_az             = var.multi_az
  db_subnet_group_name = aws_db_subnet_group.db_sg.name
  vpc_security_group_ids = var.security_group_ids
  skip_final_snapshot  = true

  tags = var.tags
}

resource "aws_db_subnet_group" "db_sg" {
  name       = var.db_subnet_group_name
  subnet_ids = var.subnet_ids

  tags = var.tags
}
