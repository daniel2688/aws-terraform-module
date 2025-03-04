output "public_subnet_ids" {
  description = "The IDs of the public subnets"
  value       = module.networking.public_subnet_ids
}

output "private_subnet_ids" {
  description = "The IDs of the private subnets"
  value       = module.networking.private_subnet_ids
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.networking.vpc_id
}

output "frontend_public_ips" {
  description = "Public IP addresses of the frontend instances"
  value       = module.frontend.frontend_public_ips
}

output "frontend_public_dns" {
  description = "Public DNS names of the frontend instances"
  value       = module.frontend.frontend_public_dns
}

output "backend_private_ips" {
  description = "Private IP addresses of the backend instances"
  value       = module.backend.backend_private_ips
}

output "backend_private_dns" {
  description = "Private DNS names of the backend instances"
  value       = module.backend.backend_private_dns
}

output "frontend_instance_ids" {
  description = "IDs of the frontend instances"
  value       = module.frontend.frontend_instance_ids
}

output "backend_instance_ids" {
  description = "IDs of the backend instances"
  value       = module.backend.backend_instance_ids
}

output "database_endpoint" {
  description = "The endpoint of the RDS instance"
  value       = module.database.database_endpoint
}

output "database_port" {
  description = "The port of the RDS instance"
  value       = module.database.database_port
}

output "alb_dns_name" {
  description = "ALB DNS Name from the module"
  value       = module.alb_autoscaling.alb_dns_name
}

output "alb_arn" {
  description = "ALB ARN from the module"
  value       = module.alb_autoscaling.alb_arn
}

output "application_load_balancer_arn" {
  description = "ARN of the Application Load Balancer"
  value       = module.alb_autoscaling.application_load_balancer_arn
}

output "waf" {
  description = "value of the WAF"
  value       = module.security.waf_web_acl_arn
}