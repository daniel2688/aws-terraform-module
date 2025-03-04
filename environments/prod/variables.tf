variable "aws_region" {
  description = "The AWS region to create resources in"
  type        = string
}

# Instance Variables
variable "front_instance_count" {
  description = "Number of frontend instances to launch"
  type        = number
  default     = 2
}

variable "back_instance_count" {
  description = "Number of backend instances to launch"
  type        = number
  default     = 2
}

variable "frontend_ami" {
  description = "The AMI to use for the frontend instances"
  type        = string
}

variable "backend_ami" {
  description = "The AMI to use for the backend instances"
  type        = string
}

variable "front_instance_type" {
  description = "The type of instance to use for frontend"
  type        = string
}

variable "back_instance_type" {
  description = "The type of instance to use for backend"
  type        = string
}

variable "public_key_name" {
  description = "The key name to use for frontend instances"
  type        = string
}

variable "private_key_name" {
  description = "The key name to use for backend instances"
  type        = string
}

# Networking Variables
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for the public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for the private subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "subnet_ids" {
  description = "List of subnet IDs for instances"
  type        = list(string)
  default     = [] # Valor por defecto
}

variable "security_group_ids" {
  description = "List of security group IDs for instances"
  type        = list(string)
  default     = [] # Valor por defecto
}

# Database Variables
variable "allocated_storage" {
  description = "The allocated storage in gigabytes"
  type        = number
}

variable "engine" {
  description = "The database engine to use"
  type        = string
}

variable "instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
}

variable "db_name" {
  description = "The name of the database to create"
  type        = string
}

variable "username" {
  description = "Username for the master DB user"
  type        = string
}

variable "password" {
  description = "Password for the master DB user"
  type        = string
  sensitive   = true
}

variable "multi_az" {
  description = "Specifies if the RDS instance is multi-AZ"
  type        = bool
}

# Security Rules
variable "ingress_rules_frontend" {
  description = "List of ingress rules for frontend"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = []
}

variable "egress_rules_frontend" {
  description = "List of egress rules for frontend"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = []
}

variable "ingress_rules_backend" {
  description = "List of ingress rules for backend"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = []
}

variable "egress_rules_backend" {
  description = "List of egress rules for backend"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = []
}

variable "ingress_rules_database" {
  description = "List of ingress rules for database"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = []
}

variable "egress_rules_database" {
  description = "List of egress rules for database"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = []
}

# Autoscaling Configuration
variable "autoscaling_config" {
  type = object({
    desired_capacity = number
    max_size         = number
    min_size         = number
  })
}

# Metadata and Tags
variable "tags" {
  description = "Common tags for all resources"
  type        = map(string)
}

variable "environment" {
  description = "Environment (e.g., dev, qa, prod)"
  type        = string
}

variable "suffix" {
  description = "Dynamic suffix for resource naming"
  type        = string
  default     = "suffix"
}

variable "db_subnet_group_name" {
  description = "Name of the DB subnet group"
  type        = string
}

# variable "project" {
#   description = "Project name"
#   type        = string
# }
