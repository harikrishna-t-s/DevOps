resource "null_resource" "network" {
  triggers = {
    version = uuid()
  }
}

output "network_id" {
  value = null_resource.network.id
}