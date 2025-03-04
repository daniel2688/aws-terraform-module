resource "aws_instance" "frontend" {
  count                    = var.front_instance_count
  ami                      = var.frontend_ami
  instance_type            = var.front_instance_type
  key_name                 = var.public_key_name
  subnet_id                = var.subnet_ids[count.index]
  vpc_security_group_ids   = var.security_group_ids
  associate_public_ip_address = true # Habilitar IP pública

  tags = merge(
    var.tags,  # Mantiene las etiquetas originales
    {
      Name = "ec2-frontend-${var.environment}-${count.index}"  # Nombre dinámico
    }
  )

user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install -y apache2
              sudo systemctl start apache2
              sudo systemctl enable apache2
              echo "<h1>Bienvenido a Apache en EC2</h1>" | sudo tee /var/www/html/index.html
              EOF
}
