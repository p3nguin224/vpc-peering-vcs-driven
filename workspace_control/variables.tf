variable "org-name" {
  description = "Organization Name"
  type        = string
  default     = "thawzin-tfc"
}

variable "workspace_list" {
  description = "List of Workspace names"
  type        = map(string)
  default = {
    be-network-ws  = "be-network-ws"
    fe-network-ws  = "fe-network-ws"
    be-security-ws = "be-security-ws"
    fe-security-ws = "fe-security-ws"
    be-compute-ws  = "be-compute-ws"
    fe-compute-ws  = "fe-compute-ws"
    vpc-peering    = "vpc-peering-fe-to-be"
  }

}
