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

variable "db_subnet_group_name" {
  description = "The name of the DB subnet group to associate"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs to be used by the DB subnet group"
  type        = list(string)
  default     = []
}

variable "security_group_ids" {
  description = "List of security group IDs to associate with"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Common tags to assign to resources"
  type        = map(string)
}

variable "suffix" {
  description = "Dynamic suffix passed from the main configuration"
  type        = string
}

variable "identifier" {
  description = "The name of the RDS instance identifier"
  type        = string
}
