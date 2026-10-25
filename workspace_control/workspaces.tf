resource "tfe_workspace" "workspaces" {
  for_each     = var.workspace_list
  name         = each.value
  organization = var.org-name

  allow_destroy_plan = true
}
