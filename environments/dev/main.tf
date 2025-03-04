# Networking Module
module "networking" {
  source = "../../modules/networking"

  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
  tags                 = local.common_tags
}

# Frontend Module
module "frontend" {
  source = "../../modules/frontend"

  front_instance_count = var.front_instance_count
  frontend_ami         = var.frontend_ami
  front_instance_type  = var.front_instance_type
  public_key_name      = var.public_key_name
  subnet_ids           = module.networking.public_subnet_ids
  security_group_ids   = [module.networking.frontend_sg_id]
  tags                 = local.common_tags # Correcto, es un mapa válido
  suffix               = local.suffix_name
  environment          = local.environment
}

# Backend Module
module "backend" {
  source = "../../modules/backend"

  back_instance_count = var.back_instance_count
  backend_ami         = var.backend_ami
  back_instance_type  = var.back_instance_type
  private_key_name    = var.private_key_name
  subnet_ids          = module.networking.private_subnet_ids
  security_group_ids  = [module.networking.backend_sg_id]
  tags                = local.common_tags
  suffix              = local.suffix_name
  environment         = local.environment
}

# Database Module
module "database" {
  source = "../../modules/database"

  allocated_storage    = var.allocated_storage
  engine               = var.engine
  instance_class       = var.instance_class
  db_name              = local.db_name # Sin guiones para cumplir con las restricciones de AWS
  identifier           = "rds-${local.suffix_name}"
  username             = var.username
  password             = var.password
  multi_az             = var.multi_az
  db_subnet_group_name = local.db_subnet_group_name
  subnet_ids           = module.networking.private_subnet_ids
  security_group_ids   = [module.networking.database_sg_id]
  tags                 = local.common_tags
  suffix               = local.suffix_name
}

# ALB & Autoscaling Module
module "alb_autoscaling" {
  source = "../../modules/alb_autoscaling"

  alb_name           = local.alb_name
  subnet_ids         = module.networking.public_subnet_ids
  alb_security_group = module.networking.frontend_sg_id
  vpc_id             = module.networking.vpc_id
  target_group_name  = local.target_group_name
  ami_id             = var.frontend_ami
  instance_type      = var.front_instance_type
  instance_sg_id     = module.networking.frontend_sg_id
  desired_capacity   = var.autoscaling_config.desired_capacity
  max_size           = var.autoscaling_config.max_size
  min_size           = var.autoscaling_config.min_size
  asg_name           = local.asg_name
  tags               = local.common_tags
  suffix             = local.suffix_name
}

# Security Module
module "security" {
  source = "../../modules/security"

  waf_name = local.waf_name
  alb_arn  = module.alb_autoscaling.application_load_balancer_arn
  tags     = local.common_tags
}