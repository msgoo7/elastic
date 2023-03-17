resource "aws_security_group" "base" {
  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id

  tags = {
    Name        = var.name
    Environment = var.environment
  }
}

resource "aws_security_group_rule" "base" {
  count = length(var.rules)


  security_group_id = aws_security_group.base.id

  type      = lookup(element(var.rules, count.index), "type")
  from_port = lookup(element(var.rules, count.index), "from_port")
  to_port   = lookup(element(var.rules, count.index), "to_port")
  protocol  = lookup(element(var.rules, count.index), "protocol")

  cidr_blocks              = lookup(element(var.rules, count.index), "cidr_blocks", null)
  description              = lookup(element(var.rules, count.index), "description", null)
  ipv6_cidr_blocks         = lookup(element(var.rules, count.index), "ipv6_cidr_blocks", null)
  prefix_list_ids          = lookup(element(var.rules, count.index), "prefix_list_ids", null)
  self                     = lookup(element(var.rules, count.index), "self", null)
  source_security_group_id = lookup(element(var.rules, count.index), "source_security_group_id", null)
}

resource "aws_security_group_rule" "base_sg" {
  count = length(var.rules_sg)


  security_group_id = aws_security_group.base.id

  type      = lookup(element(var.rules_sg, count.index), "type")
  from_port = lookup(element(var.rules_sg, count.index), "from_port")
  to_port   = lookup(element(var.rules_sg, count.index), "to_port")
  protocol  = lookup(element(var.rules_sg, count.index), "protocol")

  cidr_blocks              = lookup(element(var.rules_sg, count.index), "cidr_blocks", null)
  description              = lookup(element(var.rules_sg, count.index), "description", null)
  ipv6_cidr_blocks         = lookup(element(var.rules_sg, count.index), "ipv6_cidr_blocks", null)
  prefix_list_ids          = lookup(element(var.rules_sg, count.index), "prefix_list_ids", null)
  self                     = lookup(element(var.rules_sg, count.index), "self", null)
  source_security_group_id = lookup(element(var.rules_sg, count.index), "source_security_group_id", null)
}


