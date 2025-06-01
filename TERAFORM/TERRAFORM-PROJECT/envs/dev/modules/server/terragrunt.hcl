include {
  path = find_in_parent_folders(
    "terragrunt.hcl"
  )
}

terraform {
  source = "../../../modules//server"
}

dependencies {
  paths = ["../network"]
}

inputs = {
  network_id = dependency.network.outputs.network_id
}