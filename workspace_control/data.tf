data "tfe_workspace" "workspaces" {
  for_each     = var.workspace_list
  name         = each.value
  organization = var.org-name
}

# Project lookup
data "tfe_project" "my_project" {
  name         = "my_odic_setup"
  organization = "thawzin-tfc"
}
