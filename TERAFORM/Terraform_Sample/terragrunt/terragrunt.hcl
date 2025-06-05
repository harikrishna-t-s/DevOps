locals {
  # Load common variables from yaml files
  common_vars = yamldecode(file("${get_terragrunt_dir()}/common_vars.yaml"))
}

# Generate AWS provider block
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "${local.common_vars.aws_region}"

  default_tags {
    tags = {
      Environment = "${local.common_vars.environment}"
      Project     = "${local.common_vars.project_name}"
      ManagedBy   = "Terragrunt"
    }
  }
}
EOF
}

# Configure remote state
remote_state {
  backend = "s3"
  config = {
    bucket         = "${local.common_vars.project_name}-terraform-state"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = local.common_vars.aws_region
    encrypt        = true
    dynamodb_table = "${local.common_vars.project_name}-terraform-locks"
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}

# Configure inputs for all child configurations
inputs = {
  aws_region = local.common_vars.aws_region
  environment = local.common_vars.environment
  project_name = local.common_vars.project_name
  vpc_cidr = local.common_vars.vpc_cidr
  availability_zones = local.common_vars.availability_zones
} 