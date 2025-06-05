variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "security_group_id" {
  description = "ID of the EC2 security group"
  type        = string
}

variable "instance_role_arn" {
  description = "ARN of the IAM role for EC2 instances"
  type        = string
} 