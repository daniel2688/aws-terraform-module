resource "aws_lb" "application_load_balancer" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_security_group]
  subnets            = var.subnet_ids
  tags               = var.tags
}

resource "aws_lb_target_group" "target_group" {
  name     = var.target_group_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 2
  }

  tags = var.tags
}

resource "aws_launch_template" "asg_launch_template" {
  name_prefix   = "${var.asg_name}-${var.suffix}-lt"
  image_id      = var.ami_id
  instance_type = var.instance_type

  tag_specifications {
    resource_type = "instance"
    tags = merge(
      var.tags,
      {
        Name = "ec2-autoscaling-${var.suffix}"
      }
    )
  }

  network_interfaces {
    security_groups = [var.instance_sg_id]
  }
}

resource "aws_autoscaling_group" "asg" {
  name                = "${var.asg_name}-${var.suffix}"
  desired_capacity    = var.desired_capacity
  max_size            = var.max_size
  min_size            = var.min_size
  vpc_zone_identifier = var.subnet_ids

  launch_template {
    id      = aws_launch_template.asg_launch_template.id
    version = "$Latest"
  }

  termination_policies = ["OldestInstance", "ClosestToNextInstanceHour"]

  tag {
    key                 = "Name"
    value               = "ec2-autoscaling-${var.suffix}"
    propagate_at_launch = true
  }

  dynamic "tag" {
    for_each = var.tags
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.application_load_balancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}

resource "aws_security_group_rule" "allow_http_from_alb" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = var.instance_sg_id
  source_security_group_id = tolist(aws_lb.application_load_balancer.security_groups)[0]
  description              = "Allow HTTP traffic from ALB"
}
