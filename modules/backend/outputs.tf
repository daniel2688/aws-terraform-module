output "backend_private_ips" {
  description = "Private IP addresses of the backend instances"
  value       = aws_instance.backend.*.private_ip
}

output "backend_private_dns" {
  description = "Private DNS names of the backend instances"
  value       = aws_instance.backend.*.private_dns
}

output "backend_instance_ids" {
  description = "IDs of the backend instances"
  value       = aws_instance.backend.*.id
}
