variable "network_id" {
  type = string
  description = "The ID of the network"
}

resource "null_resource" "server" {
  triggers = {
    network_id = var.network_id
    version    = uuid()
  }
}

output "server_id" {
  value = null_resource.server.id
}