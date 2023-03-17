resource "aws_lb" "base" {
  name               = "${var.environment}-${var.type}-${var.cluster_suffix}"
  internal           = var.internal
  load_balancer_type = var.lb_type
  security_groups    = var.security_group_ids
  subnets            = var.subnet_ids


  enable_deletion_protection = true
  drop_invalid_header_fields = true

  tags = {
    Cluster     = "${var.type}-${var.environment}-${var.cluster_suffix}"
    Type        = var.type
    Environment = var.environment
  }
}

resource "aws_lb_target_group" "base" {
  name     = "${var.environment}-${var.type}-${var.cluster_suffix}"
  port     = 9200
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  health_check {
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2
    path                = "/"
    timeout             = 5
    protocol            = "HTTP"
    matcher             = "200"
  }
  tags = {
    Cluster     = "${var.type}-${var.environment}-${var.cluster_suffix}"
    Type        = var.type
    Environment = var.environment
  }
}

resource "aws_lb_listener" "base" {
  load_balancer_arn = aws_lb.base.arn
  protocol          = "HTTP"
  port              = 9200
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.base.arn
  }
}


