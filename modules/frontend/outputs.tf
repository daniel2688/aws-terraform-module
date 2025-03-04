output "frontend_public_ips" {
  description = "Public IP addresses of the frontend instances"
  value       = aws_instance.frontend.*.public_ip
}

output "frontend_public_dns" {
  description = "Public DNS names of the frontend instances"
  value       = aws_instance.frontend.*.public_dns
}

output "frontend_instance_ids" {
  description = "IDs of the frontend instances"
  value       = aws_instance.frontend.*.id
}
