variable "vpc_id" {
  type        = string
  description = "The ID of the VPC"
}

variable "public_subnet_cidr" {
  type        = string
  description = "The CIDR block for the public subnet"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  type        = string
  description = "The CIDR block for the private subnet"
  default     = "10.0.2.0/24"
}

variable "availability_zone_1" {
  type        = string
  description = "The first Availability Zone"
  default     = "us-east-1a" # Change to desired AZ
}

variable "availability_zone_2" {
  type        = string
  description = "The second Availability Zone"
  default     = "us-east-1b" # Change to desired AZ
}

variable "internet_gateway_id" {
  type        = string
  description = "The ID of the Internet Gateway"
}