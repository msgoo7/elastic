variable "ami" {
  description = "The AMI to use for the instance(s)."
  type        = string
}

variable "environment" {
  description = "The name of the environment where the instance(s) will be deployed."
  type        = string
}

variable "instance_count" {
  description = "The number of instances to deploy."
  type        = number
  default     = 1
}

variable "instance_type" {
  description = "The type (size) of the instance(s)."
  type        = string
  default     = "t3.medium"
}

variable "name" {
  description = "The name of the instance."
  type        = string
}

variable "security_group_ids" {
  description = "A list of the security group ids to associate with the instance(s)."
  type        = list(string)
  default     = [""]
}

variable "subnet_ids" {
  description = "The id of the subnet where the instance(s) will be deployed."
  type        = list(string)
  default     = []
}

variable "user_data" {
  description = "A script to run when the instance is started."
  type        = string
  default     = null
}

variable "type" {
  description = "The type of alb"
  type        = string
  default     = "search"
}

variable "cluster_suffix" {
  description = "The name of cluster which the lb belongs to"
  type        = string
}

variable "volume_size" {
  description = "The type of the root volume"
  type        = string
  default     = "32"
}
variable "key_name" {
  description = "The key used for ssh into the instance"
  default     = "bloomfire_20200224"
}

variable "target_group_id" {
  description = "The id of the target group"
  type        = string
}
