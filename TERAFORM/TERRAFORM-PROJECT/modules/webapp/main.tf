variable "server_id" {
  type = string
  description = "The ID of the server"
}

resource "null_resource" "webapp" {
  triggers = {
    server_id = var.server_id
    version   = uuid()
  }
}