resource "aws_lb" "ecs_load_balancer" {
  name = "ecs-load-balancer"

  internal           = false
  load_balancer_type = "application"

  security_groups = [aws_security_group.lb.id]
  subnets         = aws_subnet.public.*.id
}


// TODO: Change this to be HTTPS and port 443 (Add SSL certificate / domain stuff)
resource "aws_alb_target_group" "ecs_application_tg" {
  name        = "ecs-lb-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main.id
  target_type = "ip"

  health_check {
    enabled             = true
    healthy_threshold   = "3"
    interval            = "30"
    matcher             = "200"
    path                = var.health_check_path
    protocol            = "HTTP"
    timeout             = "4"
    unhealthy_threshold = "3"
  }
}

# Redirect all traffic from the ALB to the target group
resource "aws_alb_listener" "application" {
  load_balancer_arn = aws_lb.ecs_load_balancer.arn
  port              = var.app_port
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.ecs_application_tg.id
    type             = "forward"
  }
}
