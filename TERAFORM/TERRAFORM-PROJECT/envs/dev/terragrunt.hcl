include {
  path = find_in_parent_folders()
}

terraform {
  # This makes Terragrunt run Terraform in the root of the
  # module (i.e., the same directory as this file).
  source = find_in_parent_folders()
}

remote_state {
  backend = "local"
  config = {
    path = "${get_path_to_repo_root()}/terraform.tfstate"
  }
}