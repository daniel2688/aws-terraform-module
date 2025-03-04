output "database_endpoint" {
  description = "The endpoint of the RDS instance"
  value       = aws_db_instance.database.endpoint
}

output "database_port" {
  description = "The port of the RDS instance"
  value       = aws_db_instance.database.port
}
