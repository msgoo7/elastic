variable "description" {
  description = "A brief description of the use case for the SG."
  type        = string
}

variable "environment" {
  description = "The name of the environment for the SG."
  type        = string
}

variable "name" {
  description = "The name of the security group (should indicate the reason/functionality for the SG)."
  type        = string
}

variable "rules" {
  description = "A list of rules to be applied in the SG."
  type        = list(any)
}

variable "rules_sg" {
  description = "A list of rules to be applied in the SG."
  type        = list(any)
}
variable "vpc_id" {
  description = "The id of the vpc for the SG."
  type        = string
}
