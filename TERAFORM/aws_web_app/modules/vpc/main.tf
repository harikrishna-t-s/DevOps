resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr
    tags = {
        Name = var.vpc_name
    }
}output "vpc_id" {
  value       = aws_vpc.main.id
  description = "The ID of the VPC"
}