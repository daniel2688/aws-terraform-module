# variables.tf
variable "back_instance_count" {
  description = "Number of instances to launch"
  type        = number
  default     = 2
}

variable "backend_ami" {
  description = "The AMI to use for the instance"
  type        = string
}

variable "back_instance_type" {
  description = "The type of instance to use"
  type        = string
}

variable "private_key_name" {
  description = "The key name to use for the instance"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs to launch instances in"
  type        = list(string)
  default     = []
}

variable "security_group_ids" {
  description = "List of security group IDs to associate"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "A map of tags to assign to the instances"
  type        = map(string)
}

variable "environment" {
  description = "The environment name"
  type        = string
}

variable "suffix" {
  description = "Dynamic suffix passed from the main configuration"
  type        = string
}
