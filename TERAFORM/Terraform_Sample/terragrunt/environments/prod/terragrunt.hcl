include {
  path = find_in_parent_folders()
}

locals {
  env_vars = yamldecode(file("${get_terragrunt_dir()}/env_vars.yaml"))
}

# Merge environment-specific variables with common variables
inputs = {
  environment = "prod"
  min_size = local.env_vars.min_size
  max_size = local.env_vars.max_size
  desired_capacity = local.env_vars.desired_capacity
} 