aws_region           = "us-east-1"
front_instance_count = 2
back_instance_count  = 4
frontend_ami         = "ami-0427090fd1714168b"
backend_ami          = "ami-0427090fd1714168b"
front_instance_type  = "t2.micro"
back_instance_type   = "t2.micro"
public_key_name      = "public-key"
private_key_name     = "private-key"

vpc_cidr             = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
availability_zones   = ["us-east-1a", "us-east-1b"]

allocated_storage = 20
engine            = "mysql"
instance_class    = "db.t3.micro"
db_name           = "dbprod"
username          = "admin"
password          = "password"
multi_az          = false

# Reglas para el frontend
ingress_rules_frontend = [
  {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

egress_rules_frontend = [
  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

# Reglas para el backend
ingress_rules_backend = [
  {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

egress_rules_backend = [
  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

# Reglas para la base de datos
ingress_rules_database = [
  {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

egress_rules_database = [
  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

autoscaling_config = {
  desired_capacity = 2
  max_size         = 2
  min_size         = 1
}

tags = {
  environment = "prod"
  project     = "auna"
  owner       = "cloudops"
  region      = "us-east-1"
}

# suffix               = "default-suffix"
environment          = "prod"
db_subnet_group_name = "default-db-subnet-group"