variable "waf_name" {
  description = "Name of the WAF Web ACL"
  type        = string
}

variable "alb_arn" {
  description = "ARN of the ALB to associate with WAF"
  type        = string
}

variable "tags" {
  description = "Tags for WAF resources"
  type        = map(string)
}
