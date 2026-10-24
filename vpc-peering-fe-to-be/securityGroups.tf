##### Frontend Security Groups ########
## pri-sgp-02 - INBOUND ##
resource "aws_vpc_security_group_ingress_rule" "pri-sgp-02-ssh-from-be-pri-sgp-02" {
  security_group_id = data.terraform_remote_state.fe-security-ws.outputs.private-sgs-id-list[1]
  cidr_ipv4         = data.terraform_remote_state.be-network-ws.outputs.private_subnets_cidr[1]
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}
resource "aws_vpc_security_group_ingress_rule" "pri-sgp-02-ping-from-be-pri-sgp-02" {
  security_group_id = data.terraform_remote_state.fe-security-ws.outputs.private-sgs-id-list[1]
  cidr_ipv4         = data.terraform_remote_state.be-network-ws.outputs.private_subnets_cidr[1]
  from_port         = 8
  ip_protocol       = "icmp"
  to_port           = 0
}

## pri-sgp-02 - OUTBOUND ##
resource "aws_vpc_security_group_egress_rule" "pri-sgp-02-ssh-to-be-pri-sgp-02" {
  security_group_id = data.terraform_remote_state.fe-security-ws.outputs.private-sgs-id-list[1]
  cidr_ipv4         = data.terraform_remote_state.be-network-ws.outputs.private_subnets_cidr[1]
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}
resource "aws_vpc_security_group_egress_rule" "pri-sgp-02-ping-to-be-pri-sgp-02" {
  security_group_id = data.terraform_remote_state.fe-security-ws.outputs.private-sgs-id-list[1]
  cidr_ipv4         = data.terraform_remote_state.be-network-ws.outputs.private_subnets_cidr[1]
  from_port         = 8
  ip_protocol       = "icmp"
  to_port           = 0
}




## pri-sgp-03 - INBOUND ##
resource "aws_vpc_security_group_ingress_rule" "pri-sgp-03-ssh-from-be-pri-sgp-03" {
  security_group_id = data.terraform_remote_state.fe-security-ws.outputs.private-sgs-id-list[2]
  cidr_ipv4         = data.terraform_remote_state.be-network-ws.outputs.private_subnets_cidr[2]
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}
resource "aws_vpc_security_group_ingress_rule" "pri-sgp-03-ping-from-be-pri-sgp-03" {
  security_group_id = data.terraform_remote_state.fe-security-ws.outputs.private-sgs-id-list[2]
  cidr_ipv4         = data.terraform_remote_state.be-network-ws.outputs.private_subnets_cidr[2]
  from_port         = 8
  ip_protocol       = "icmp"
  to_port           = 0
}

## pri-sgp-03 - OUTBOUND ##
resource "aws_vpc_security_group_egress_rule" "pri-sgp-02-ssh-to-be-pri-sgp-03" {
  security_group_id = data.terraform_remote_state.fe-security-ws.outputs.private-sgs-id-list[2]
  cidr_ipv4         = data.terraform_remote_state.be-network-ws.outputs.private_subnets_cidr[2]
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}
resource "aws_vpc_security_group_egress_rule" "pri-sgp-02-ping-to-be-pri-sgp-03" {
  security_group_id = data.terraform_remote_state.fe-security-ws.outputs.private-sgs-id-list[2]
  cidr_ipv4         = data.terraform_remote_state.be-network-ws.outputs.private_subnets_cidr[2]
  from_port         = 8
  ip_protocol       = "icmp"
  to_port           = 0
}


##### Backend Security Groups ########
## pri-sgp-02 - INBOUND ##
resource "aws_vpc_security_group_ingress_rule" "be-pri-sgp-02-ssh-from-fe-pri-sgp-02" {
  provider          = aws.backend
  security_group_id = data.terraform_remote_state.be-security-ws.outputs.private-sgs-id-list[1]
  cidr_ipv4         = data.terraform_remote_state.fe-network-ws.outputs.private_subnets_cidr[1]
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}
resource "aws_vpc_security_group_ingress_rule" "be-pri-sgp-02-ping-from-fe-pri-sgp-02" {
  provider          = aws.backend
  security_group_id = data.terraform_remote_state.be-security-ws.outputs.private-sgs-id-list[1]
  cidr_ipv4         = data.terraform_remote_state.fe-network-ws.outputs.private_subnets_cidr[1]
  from_port         = 8
  ip_protocol       = "icmp"
  to_port           = 0
}

## pri-sgp-02 - OUTBOUND ##
resource "aws_vpc_security_group_egress_rule" "be-pri-sgp-02-ssh-to-be-pri-sgp-02" {
  provider          = aws.backend
  security_group_id = data.terraform_remote_state.be-security-ws.outputs.private-sgs-id-list[1]
  cidr_ipv4         = data.terraform_remote_state.fe-network-ws.outputs.private_subnets_cidr[1]
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}
resource "aws_vpc_security_group_egress_rule" "be-pri-sgp-02-ping-to-be-pri-sgp-02" {
  provider          = aws.backend
  security_group_id = data.terraform_remote_state.be-security-ws.outputs.private-sgs-id-list[1]
  cidr_ipv4         = data.terraform_remote_state.fe-network-ws.outputs.private_subnets_cidr[1]
  from_port         = 8
  ip_protocol       = "icmp"
  to_port           = 0
}



## pri-sgp-03 - INBOUND ##
resource "aws_vpc_security_group_ingress_rule" "be-pri-sgp-03-ssh-from-fe-pri-sgp-03" {
  provider          = aws.backend
  security_group_id = data.terraform_remote_state.be-security-ws.outputs.private-sgs-id-list[2]
  cidr_ipv4         = data.terraform_remote_state.fe-network-ws.outputs.private_subnets_cidr[2]
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}
resource "aws_vpc_security_group_ingress_rule" "be-pri-sgp-03-ping-from-fe-pri-sgp-03" {
  provider          = aws.backend
  security_group_id = data.terraform_remote_state.be-security-ws.outputs.private-sgs-id-list[2]
  cidr_ipv4         = data.terraform_remote_state.fe-network-ws.outputs.private_subnets_cidr[2]
  from_port         = 8
  ip_protocol       = "icmp"
  to_port           = 0
}

## pri-sgp-03 - OUTBOUND ##
resource "aws_vpc_security_group_egress_rule" "be-pri-sgp-03-ssh-to-be-pri-sgp-03" {
  provider          = aws.backend
  security_group_id = data.terraform_remote_state.be-security-ws.outputs.private-sgs-id-list[2]
  cidr_ipv4         = data.terraform_remote_state.fe-network-ws.outputs.private_subnets_cidr[2]
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}
resource "aws_vpc_security_group_egress_rule" "be-pri-sgp-03-ping-to-be-pri-sgp-03" {
  provider          = aws.backend
  security_group_id = data.terraform_remote_state.be-security-ws.outputs.private-sgs-id-list[2]
  cidr_ipv4         = data.terraform_remote_state.fe-network-ws.outputs.private_subnets_cidr[2]
  from_port         = 8
  ip_protocol       = "icmp"
  to_port           = 0
}
