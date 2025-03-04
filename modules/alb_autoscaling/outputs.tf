output "alb_dns_name" {
  description = "DNS Name of the ALB"
  value       = aws_lb.application_load_balancer.dns_name
}

output "alb_arn" {
  description = "ARN of the ALB"
  value       = aws_lb.application_load_balancer.arn
}

output "application_load_balancer_arn" {
  description = "ARN of the Application Load Balancer"
  value       = aws_lb.application_load_balancer.arn
}
