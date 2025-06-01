# terragrunt.hcl (root)
terraform {
  source = "git::https://github.com/gruntwork-io/terragrunt-infrastructure-modules//aws/vpc?ref=v0.17.2"
}

# Configure Terragrunt to automatically store Terraform state files in an S3 bucket
remote_state {
  backend = "local"  # Using local for simulation.  Change for real backends!
    config = {
      path = "${get_path_to_repo_root()}/terraform.tfstate"
    }
}