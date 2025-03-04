resource "aws_wafv2_web_acl" "alb_waf" {
  name        = var.waf_name
  description = "WAF for ALB to protect against common attacks"
  scope       = "REGIONAL"

  default_action {
    allow {}
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "wafALBMetric"
    sampled_requests_enabled   = true
  }

  rule {
    name     = "AWSManagedRulesCommonRuleSet"
    priority = 1
    override_action {
      none {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesCommonRuleSet"
        vendor_name = "AWS"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "CommonRuleSet"
      sampled_requests_enabled   = true
    }
  }

  tags = var.tags
}

resource "aws_wafv2_web_acl_association" "alb_waf_association" {
  resource_arn = var.alb_arn
  web_acl_arn  = aws_wafv2_web_acl.alb_waf.arn
}
