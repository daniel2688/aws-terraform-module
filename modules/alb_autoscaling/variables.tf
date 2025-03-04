variable "alb_name" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "alb_security_group" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "target_group_name" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "instance_sg_id" {
  type = string
}

variable "desired_capacity" {
  type = number
}

variable "max_size" {
  type = number
}

variable "min_size" {
  type = number
}

variable "asg_name" {
  type = string
}

variable "tags" {
  description = "Common tags for all resources"
  type        = map(string)
}

variable "environment" {
  description = "Deployment environment"
  type        = string
default       = "dev"
}

variable "suffix" {
  description = "Dynamic suffix passed from the main configuration"
  type        = string
}

