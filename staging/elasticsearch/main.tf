module "staging_alb_sg" {
  source      = "../../modules/security_group"
  vpc_id      = var.vpc_id
  environment = var.environment_name
  name        = "${var.environment_name}-search-alb"
  description = "SG for serach alb"

  rules = [
    {
      type        = "ingress"
      from_port   = 9200
      to_port     = 9200
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      type        = "egress"
      from_port   = 0
      to_port     = 65535
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
  rules_sg = [
  ]
}

module "staging_ec2_sg" {
  source = "../../modules/security_group"

  vpc_id      = var.vpc_id
  environment = var.environment_name
  name        = "${var.environment_name}-search-sg"
  description = "SG for serach ec2"


  rules = [
    {
      type        = "ingress"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["${var.my_ip}/32"]
    },
    {
      type        = "egress"
      from_port   = 0
      to_port     = 65535
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }

  ]
  rules_sg = [
    {
      type                     = "ingress"
      from_port                = 9200
      to_port                  = 9200
      protocol                 = "tcp"
      source_security_group_id = module.staging_alb_sg.sg_id // This should contain the security group of load-balancer
    },
  ]
}

module "staging_search_alb" {
  source = "../../modules/elb"

  vpc_id             = var.vpc_id
  environment        = var.environment_name
  security_group_ids = [module.staging_alb_sg.sg_id]
  subnet_ids         = var.subnet_ids
  cluster_suffix     = var.suffix

}


module "staging_search_ec2" {
  source = "../../modules/ec2"

  depends_on = [
    module.staging_search_alb
  ]
  ami                = var.ami
  subnet_ids         = var.subnet_ids
  user_data          = var.user_data
  security_group_ids = [module.staging_ec2_sg.sg_id]
  target_group_id    = module.staging_search_alb.elb_target_group

  environment    = var.environment_name
  name           = "${var.environment_name}-${var.type}-NEW"
  cluster_suffix = var.suffix
}


