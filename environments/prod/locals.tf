locals {
  # Acceso directo a los valores desde las etiquetas
  environment = var.tags["environment"]
  project     = var.tags["project"]
  owner       = var.tags["owner"]

  # Sufijo dinámico que une el proyecto y el ambiente
  suffix_name = "${local.environment}-${local.project}-${local.owner}"

  # Definir tags comunes incluyendo el sufijo
  common_tags = {
    Project     = local.environment
    Environment = local.project
    Owner       = local.owner
    Suffix      = local.suffix_name
  }

  # Nombres de recursos usando el sufijo dinámico
  vpc_name             = "vpc-${local.suffix_name}"
  frontend_sg_name     = "sg-frontend-${local.suffix_name}"
  backend_sg_name      = "sg-backend-${local.suffix_name}"
  database_sg_name     = "sg-database-${local.suffix_name}"
  alb_name             = "alb-${local.suffix_name}"
  target_group_name    = "tg-${local.suffix_name}"
  asg_name             = "asg-${local.suffix_name}"
  db_subnet_group_name = "db-subnet-group-${local.suffix_name}"

  # Nombres para las instancias EC2
  frontend_instance_name = "ec2-frontend-${local.suffix_name}"
  backend_instance_name  = "ec2-backend-${local.suffix_name}"

  # Nombres para las instancias RDS
  db_name = "rds${replace(local.suffix_name, "-", "")}"

  # Nombres para WAF
  waf_name = "alb-waf-protection-${local.environment}"
}
