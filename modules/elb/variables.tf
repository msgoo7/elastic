variable "internal" {
  description = "Define whether the lb is internal or not"
  type        = bool
  default     = true
}

variable "type" {
  description = "The type of service"
  type        = string
  default     = "search"
}

variable "environment" {
  description = "The name of the environment. Used to specify the Name tag for all resources in the environment."
  type        = string
}

variable "cluster_suffix" {
  description = "The name of cluster which the lb belongs to"
  type        = string
}

variable "security_group_ids" {
  description = "A list of the security group ids to associate with the elb"
  type        = list(string)
  default     = [""]
}

variable "subnet_ids" {
  description = "A list of subnets associated to the elb"
  type        = list(string)
  default     = []
}

variable "vpc_id" {
  description = "The id of the vpc that the elb should belongs to"
  type        = string
}

variable "lb_type" {
  description = "The type of the load balancer"
  type        = string
  default     = "application"
}

