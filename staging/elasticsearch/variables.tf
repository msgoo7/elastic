variable "vpc_id" {
  description = "The id of the vpc that the elb should belongs to"
  type        = string
  default     = "vpc-0f40dcf091da301f9"
}

variable "environment_name" {
  description = "The name of the environment where the instance(s) will be deployed."
  type        = string
  default     = "staging"
}

variable "ami" {
  description = "The AMI to use for the instance(s)."
  type        = string
  default     = "ami-043f1c7c77950ccec"
}

variable "subnet_ids" {
  description = "A list of subnets associated to the elb"
  type        = list(string)
  default     = ["subnet-0bc39b0f95dd29579", "subnet-0624946ed484b1c10", "subnet-091165caf0cf97d7b"]
}

variable "user_data" {
  description = "A script to run when the instance is started."
  type        = string
  default     = null
}

variable "suffix" {
  description = "suffix of the cluster i.e the creatio date"
  type        = string
  default     = "14032023"
}

variable "my_ip" {
  description = "The ip address of the developer for ssh"
  type        = string
  default     = "49.43.155.41"
}

variable "type" {
  description = "The type of service"
  type        = string
  default     = "search"
}
