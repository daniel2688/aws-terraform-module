output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = aws_subnet.public[*].id  # Captura todos los IDs de subredes públicas
}

output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = aws_subnet.private[*].id  # Captura todos los IDs de subredes privadas
}

output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "frontend_sg_id" {
  description = "Frontend Security Group ID"
  value       = aws_security_group.frontend_sg.id
}

output "backend_sg_id" {
  description = "Backend Security Group ID"
  value       = aws_security_group.backend_sg.id
}

output "database_sg_id" {
  description = "Database Security Group ID"
  value       = aws_security_group.database_sg.id
}
