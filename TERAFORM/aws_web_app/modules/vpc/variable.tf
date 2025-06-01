variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "The CIDR block for the VPC"
}
variable "vpc_name" {
  type        = string
  default     = "main-vpc"
  description = "The name of the VPC"
}
