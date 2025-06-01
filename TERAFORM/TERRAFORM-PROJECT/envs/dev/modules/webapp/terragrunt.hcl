include {
  path = find_in_parent_folders(
    "terragrunt.hcl"
  )
}

terraform {
  source = "../../../modules//webapp"
}

dependencies {
  paths = ["../server"]
}

inputs = {
  server_id = dependency.server.outputs.server_id
}