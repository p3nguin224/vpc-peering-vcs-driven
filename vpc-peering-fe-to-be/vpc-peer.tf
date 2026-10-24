# Requester (Frontend)
resource "aws_vpc_peering_connection" "frontend-to-backend-peer" {
  peer_vpc_id = data.terraform_remote_state.be-network-ws.outputs.be-network_vpc_id
  # couldn't set auto_accept with different region
  auto_accept = false
  vpc_id      = data.terraform_remote_state.fe-network-ws.outputs.fe-network_vpc_id
  peer_region = var.peer-region
}

# Accepter (Backend)
resource "aws_vpc_peering_connection_accepter" "backend-peer-accept" {
  provider                  = aws.backend
  vpc_peering_connection_id = aws_vpc_peering_connection.frontend-to-backend-peer.id
  auto_accept               = true

  accepter {
    allow_remote_vpc_dns_resolution = true
  }
}

# It can be only used after peer connection is accepted
resource "aws_vpc_peering_connection_options" "peer-option" {
  depends_on                = [aws_vpc_peering_connection_accepter.backend-peer-accept]
  vpc_peering_connection_id = aws_vpc_peering_connection.frontend-to-backend-peer.id

  requester {
    allow_remote_vpc_dns_resolution = true
  }
}

#######################

resource "aws_route" "priv-fe-to-be-route" {
  depends_on                = [aws_vpc_peering_connection_accepter.backend-peer-accept]
  count                     = 2
  route_table_id            = data.terraform_remote_state.fe-network-ws.outputs.private_routeTables_id[count.index + 1]
  destination_cidr_block    = data.terraform_remote_state.be-network-ws.outputs.private_subnets_cidr[count.index + 1]
  vpc_peering_connection_id = aws_vpc_peering_connection.frontend-to-backend-peer.id
}

resource "aws_route" "priv-be-to-fe-route" {
  provider                  = aws.backend
  count                     = 2
  depends_on                = [aws_vpc_peering_connection_accepter.backend-peer-accept]
  route_table_id            = data.terraform_remote_state.be-network-ws.outputs.private_routeTables_id[count.index + 1]
  destination_cidr_block    = data.terraform_remote_state.fe-network-ws.outputs.private_subnets_cidr[count.index + 1]
  vpc_peering_connection_id = aws_vpc_peering_connection.frontend-to-backend-peer.id
}

