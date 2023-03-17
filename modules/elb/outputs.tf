output "elb_arn" {
  description = "The id of the alb"
  value       = aws_lb.base.id
}
output "elb_target_group" {
  description = "The id of the target groups"
  value       = aws_lb_target_group.base.arn
}
