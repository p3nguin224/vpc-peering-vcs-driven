data "aws_availability_zones" "available_az" {
  region = var.region
  state  = "available"
}


# data "terraform_remote_state" "fe-network-ws" {
#   backend = "remote"
#   config = {
#     organization = "thawzin-tfc"
#     workspaces = {
#       name = "fe-network-ws"
#     }
#   }
# }
