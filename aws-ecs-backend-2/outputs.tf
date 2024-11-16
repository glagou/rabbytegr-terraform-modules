output "alb_hostname" {
  value = "${aws_lb.ecs_load_balancer.dns_name}:3000"
}
