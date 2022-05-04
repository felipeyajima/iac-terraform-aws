resource "aws_db_subnet_group" "db-subnet-group-sre" {
  name       = "db-subnet-group-sre"
  subnet_ids = [aws_subnet.subnet_1.id, aws_subnet.subnet_2.id]
}

resource "aws_db_instance" "db-confiabilidade" {
  identifier        = "confiabilidade"
  instance_class    = "db.t3.micro"
  allocated_storage = 20
  storage_type      = "gp2"
  engine            = "mysql"
  engine_version    = "8.0"
  apply_immediately = true
  multi_az          = false
  username          = "felipe"
  password          = random_password.confiabilidade.result

  publicly_accessible = false
  skip_final_snapshot = false
  deletion_protection = false

  db_subnet_group_name   = aws_db_subnet_group.db-subnet-group-sre.name
  vpc_security_group_ids = [aws_security_group.jenkins-sg.id]


}
