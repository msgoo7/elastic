resource "aws_instance" "base" {
  count = var.instance_count

  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = element(var.subnet_ids, count.index)
  user_data              = var.user_data
  vpc_security_group_ids = var.security_group_ids
  key_name               = var.key_name
  iam_instance_profile   = "search"
  root_block_device {
    volume_size           = var.volume_size
    volume_type           = "gp2"
    delete_on_termination = true
  }

  tags = {
    Name        = var.name
    Environment = var.environment
    Type        = var.type
    Cluster     = "${var.environment}-${var.type}-${var.cluster_suffix}"
  }
}

//For attaching isntance to elb
resource "aws_lb_target_group_attachment" "base" {
  count            = var.instance_count
  target_group_arn = var.target_group_id
  target_id        = aws_instance.base[count.index].id
  port             = 9200
}
